package main

import (
	"bytes"
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"io/fs"
	"log"
	"os"
	"path/filepath"
	"regexp"
	"strings"

	"github.com/fsnotify/fsnotify"
	"github.com/klauspost/compress/zstd"
)

// Input

type PolyProject struct {
	ProjectName string `json:"ProjectName"`
	MainWorld   string `json:"MainWorld"`
}

type PolyWorld struct {
	Version            string            `json:"Version"`
	Objects            []PolyObject      `json:"Objects"`
	NonInstanceObjects []json.RawMessage `json:"NonInstanceObjects"`
}

type PolyObject struct {
	Name       string         `json:"Name"`
	ClassName  string         `json:"ClassName"`
	ID         string         `json:"ID"`
	Properties map[string]any `json:"Properties"`
	Children   []PolyObject   `json:"Children"`
}

// Output

type Node struct {
	Name      string   `json:"name"`
	ClassName string   `json:"className"`
	FilePaths []string `json:"filePaths,omitempty"`
	Children  []Node   `json:"children,omitempty"`
}

const (
	ProgramName = "polysource"

	SourcemapUsage = "  " + ProgramName + " [flags] <project-dir>\t\tgenerate sourcemap (default)"
	DefsUsage      = "  " + ProgramName + " defs [flags] <project-dir>\t\tgenerate a modernized and patched copy of def.d.luau"

	LuauFolderPath = ".poly/luau/"
	DefFileName    = "def.d.luau"
	NewDefFileName = "def.modern.luau"

	WorldFileExt = ".poly"
	MetaFileExt  = ".meta"

	ProjectFileName   = "project.ptproj"
	SourcemapFileName = "sourcemap.json"

	WriteFilePerm = 0o644
)

var (
	classOpenRe   = regexp.MustCompile(`(?m)^declare class ([A-Za-z0-9_]+)( extends [A-Za-z0-9_]+)?$`)
	classInlineRe = regexp.MustCompile(`(?m)^declare class ([A-Za-z0-9_]+)( extends [A-Za-z0-9_]+)? end$`)

	version = "dev"
)

func main() {
	args := os.Args[1:]

	if len(args) > 0 && (args[0] == "-version" || args[0] == "--version") {
		fmt.Println(ProgramName, version)
		os.Exit(0)
	}

	if len(args) > 0 && args[0] == "defs" {
		if err := runDefs(args[1:]); err != nil {
			log.Fatal(err)
		}
		return
	}

	if err := runSourcemap(args); err != nil {
		log.Fatal(err)
	}
}

func runDefs(args []string) error {
	fs := flag.NewFlagSet("polysource defs", flag.ExitOnError)
	legacyFlag := fs.Bool("legacy", false, "keep pre-1.69 declare class syntax. Still patches world and require()")
	fs.Usage = func() {
		fmt.Fprintln(os.Stderr, "usage:")
		fmt.Fprintln(os.Stderr, DefsUsage)
		fmt.Fprintln(os.Stderr)
		fs.PrintDefaults()
	}
	fs.Parse(args)

	root, err := resolveRoot(fs)
	if err != nil {
		return err
	}
	return convertDefs(root, *legacyFlag)
}

func runSourcemap(args []string) error {
	fs := flag.NewFlagSet("polysource", flag.ExitOnError)
	worldFlag := fs.String("world", "", "generate for a specific world file instead of the project's MainWorld")
	watchFlag := fs.Bool("watch", false, "watch project files and regenerate")
	fs.Usage = func() {
		fmt.Fprintln(os.Stderr, "usage:")
		fmt.Fprintln(os.Stderr, SourcemapUsage)
		fmt.Fprintln(os.Stderr, DefsUsage)
		fmt.Fprintln(os.Stderr)
		fs.PrintDefaults()
	}
	fs.Parse(args)

	root, err := resolveRoot(fs)
	if err != nil {
		return err
	}

	var worldFile string
	if *worldFlag != "" {
		worldFile = *worldFlag
		if !strings.HasSuffix(worldFile, WorldFileExt) {
			worldFile += WorldFileExt
		}
	} else {
		project, err := readProjectFile(root, ProjectFileName)
		if err != nil {
			return err
		}
		worldFile = project.MainWorld
	}

	if *watchFlag {
		return watchWorld(root, worldFile)
	}

	return generate(root, worldFile)
}

func resolveRoot(fs *flag.FlagSet) (string, error) {
	if len(fs.Args()) == 1 {
		return filepath.Abs(fs.Args()[0])
	} else {
		fs.Usage()
		os.Exit(2)
		return "", nil
	}
}

func convertDefs(root string, legacyFlag bool) error {
	data, err := os.ReadFile(filepath.Join(root, LuauFolderPath, DefFileName))
	if err != nil {
		return fmt.Errorf("read defs: %w", err)
	}

	out := data
	if !legacyFlag {
		out = classOpenRe.ReplaceAll(out, []byte("declare extern type $1$2 with"))
		out = classInlineRe.ReplaceAll(out, []byte("declare extern type $1$2 with\nend"))
	}
	out = bytes.Replace(out, []byte("declare world: World"), []byte("declare world: World & DataModel"), 1)
	out = bytes.Replace(out, []byte("\ndeclare function require(moduleScript: (ModuleScript)): any\n"), []byte(""), 1)

	dstPath := filepath.Join(root, LuauFolderPath, NewDefFileName)

	oldData, err := os.ReadFile(dstPath)
	if err != nil && !errors.Is(err, os.ErrNotExist) {
		return err
	}

	if bytes.Equal(out, oldData) {
		fmt.Println("already converted\nnothing to do")
		return nil
	}

	if err := os.WriteFile(dstPath, out, WriteFilePerm); err != nil {
		return fmt.Errorf("write defs: %w", err)
	}

	fmt.Printf("wrote %s\nadd \"./%s\" to luau-lsp.types.definitionFiles in your VS Code user settings\n", dstPath, filepath.Join(LuauFolderPath, NewDefFileName))

	return nil
}

func readProjectFile(root, filename string) (*PolyProject, error) {
	data, err := os.ReadFile(filepath.Join(root, filename))
	if err != nil {
		return nil, fmt.Errorf("read %s: %w", filename, err)
	}

	var s PolyProject
	if err := json.Unmarshal(data, &s); err != nil {
		return nil, fmt.Errorf("parse %s: %w", filename, err)
	}

	return &s, nil
}

func readWorldFile(root, filename string) (*PolyWorld, error) {
	compressedData, err := os.ReadFile(filepath.Join(root, filename))
	if err != nil {
		return nil, fmt.Errorf("read %s: %w", filename, err)
	}

	var data []byte
	if len(compressedData) > 0 && compressedData[0] == '{' {
		data = compressedData
	} else {
		decoder, err := zstd.NewReader(nil, zstd.WithDecoderConcurrency(0))
		if err != nil {
			return nil, err
		}
		defer decoder.Close()

		data, err = decoder.DecodeAll(compressedData, nil)
		if err != nil {
			return nil, fmt.Errorf("decompress %s: %w", filename, err)
		}
	}

	var s PolyWorld
	if err := json.Unmarshal(data, &s); err != nil {
		return nil, fmt.Errorf("parse %s: %w", filename, err)
	}

	return &s, nil
}

func watchWorld(root string, path string) error {
	w, err := fsnotify.NewWatcher()
	if err != nil {
		return err
	}
	defer w.Close()

	dstPath := filepath.Join(root, path)

	err = w.Add(dstPath)
	if err != nil {
		return err
	}

	if err := generate(root, path); err != nil {
		return err
	}
	fmt.Println("listening for changes in " + dstPath)

	for {
		select {
		case <-w.Events:
			err = generate(root, path)
			if err != nil {
				return err
			}
		case err := <-w.Errors:
			return err
		}
	}
}

func generate(root string, path string) error {
	world, err := readWorldFile(root, path)
	if err != nil {
		return err
	}

	metas, err := scanMetaFiles(root)
	if err != nil {
		return err
	}

	sourcemap := toSourcemap(world, strings.TrimSuffix(filepath.Base(path), WorldFileExt), metas)

	return emitSourcemap(root, &sourcemap)
}

func scanMetaFiles(root string) (map[string]string, error) {
	var metas = make(map[string]string)

	err := filepath.WalkDir(root, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if d.IsDir() || !strings.HasSuffix(d.Name(), MetaFileExt) {
			return nil
		}

		data, err := os.ReadFile(path)
		if err != nil {
			return err
		}

		var meta struct {
			ID string `json:"id"`
		}
		if err := json.Unmarshal(data, &meta); err != nil {
			return err
		}

		path, err = filepath.Rel(root, path)
		if err != nil {
			return err
		}

		metas[meta.ID] = filepath.ToSlash(strings.TrimSuffix(path, MetaFileExt))

		return nil
	})
	return metas, err
}

func toSourcemap(world *PolyWorld, worldname string, metas map[string]string) Node {
	node := Node{
		Name:      worldname,
		ClassName: "DataModel",
	}

	if len(world.Objects) == 0 {
		return node
	}

	for _, child := range world.Objects[0].Children {
		node.Children = append(node.Children, toNode(&child, metas))
	}
	return node
}

func toNode(object *PolyObject, metas map[string]string) Node {
	node := Node{
		Name:      object.Name,
		ClassName: object.ClassName,
	}

	if raw, exists := object.Properties["LinkedScript"]; exists {
		id, ok := raw.(string)
		switch {
		case !ok:
			fmt.Fprintf(os.Stderr, "warn: %s has non-string LinkedScript %#v\n", node.Name, raw)
		case metas[id] == "":
			fmt.Fprintf(os.Stderr, "warn: %s links to unknown script id %s\n", node.Name, id)
		default:
			node.FilePaths = append(node.FilePaths, metas[id])
		}
	}

	for _, child := range object.Children {
		node.Children = append(node.Children, toNode(&child, metas))
	}
	return node
}

func emitSourcemap(root string, sourcemap *Node) error {
	out, err := json.MarshalIndent(sourcemap, "", "    ")
	if err != nil {
		return err
	}

	dstPath := filepath.Join(root, SourcemapFileName)

	oldData, err := os.ReadFile(dstPath)
	if err != nil && !errors.Is(err, os.ErrNotExist) {
		return err
	}

	if bytes.Equal(out, oldData) {
		fmt.Println("sourcemap up to date")
		return nil
	}

	if err := os.WriteFile(dstPath, out, WriteFilePerm); err != nil {
		return err
	}

	fmt.Printf("wrote %s\n", dstPath)

	return nil
}
