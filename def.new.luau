-- Made by arlocomotive (https://github.com/arlocomotive)

declare json: {
	parse: (string?) -> any,
	serialize: (any?) -> string,
	null: () -> string,
	isNull: (string?) -> boolean,
}

declare guid: {
	new: () -> string,
	empty: () -> string,
}

declare _POLY_VERSION: string

declare _POLY_2: boolean

declare _LOCALTEST: boolean

declare _CLIENT: boolean?

declare _SERVER: boolean?

declare function warn<T...>(...: T...)

declare function wait(seconds: number?): number

declare function spawn<T...>(callback: (T...) -> ...any, ...: T...)

declare function tick(): number

declare function time(): number

-- Removed require() definition so luau-lsp's own takes over.

declare world: World & DataModel -- Added DataModel to make the sourcemap work.

declare script: Script

declare Environment: Environment

declare Lighting: Lighting

declare Players: Players

declare ScriptService: ScriptService

declare Hidden: Hidden

declare ServerHidden: ServerHidden

declare PlayerDefaults: PlayerDefaults

declare PlayerGUI: PlayerGUI

declare Chat: ChatService

declare Filter: FilterService

declare Camera: Camera

declare Assets: AssetsService

declare Input: InputService

declare Achievements: AchievementsService

declare Tween: TweenService

declare CoreUI: CoreUIService

declare Stats: Stats

declare Teams: Teams

declare Datastore: DatastoreService

declare Http: HttpService

declare Insert: InsertService

declare Purchases: PurchasesService

declare Capture: CaptureService

declare Presence: PresenceService

declare Creator: CreatorService

declare CreatorContext: CreatorContextService

declare IO: IOService

declare Addons: CreatorAddons

declare Selections: CreatorSelections

declare History: CreatorHistory

declare CreatorGUI: CreatorGUI

declare Preferences: PreferencesService

declare Hooks: HookService

declare extern type PTSignalConnection with
	function Disconnect(self)
end

export type PTSignal<T... = ...any> = {
	Connect: (self: PTSignal<T...>, callback: (T...) -> ()) -> PTSignalConnection,
	Disconnect: (self: PTSignal<T...>, callback: (T...) -> ()) -> (),
	Once: (self: PTSignal<T...>, callback: (T...) -> ()) -> PTSignalConnection,
	Wait: (self: PTSignal<T...>) -> T...,
}

declare extern type Enum with end

declare extern type CameraMode extends Enum with end

declare extern type CharacterModelState extends Enum with end

declare extern type CharacterAttachment extends Enum with end

declare extern type HttpRequestMethod extends Enum with end

declare extern type GrabbablePermissionMode extends Enum with end

declare extern type UIMode extends Enum with end

declare extern type SkyboxPreset extends Enum with end

declare extern type AmbientSource extends Enum with end

declare extern type MeshCollisionType extends Enum with end

declare extern type PartShape extends Enum with end

declare extern type PartMaterial extends Enum with end

declare extern type ParticleSimulationSpace extends Enum with end

declare extern type ParticleEmissionShape extends Enum with end

declare extern type ParticleOrientation extends Enum with end

declare extern type ForceMode extends Enum with end

declare extern type PlayerMovementMode extends Enum with end

declare extern type PlayerRotationMode extends Enum with end

declare extern type BuiltInAudioPreset extends Enum with end

declare extern type FontPreset extends Enum with end

declare extern type GradientImageFill extends Enum with end

declare extern type MeshAnimationType extends Enum with end

declare extern type ImageType extends Enum with end

declare extern type CtrlLockCursor extends Enum with end

declare extern type ClientPlatform extends Enum with end

declare extern type TweenTransition extends Enum with end

declare extern type TweenDirection extends Enum with end

declare extern type DominantAxis extends Enum with end

declare extern type AspectRatioScaleType extends Enum with end

declare extern type UIMaskMode extends Enum with end

declare extern type UILayoutAlignment extends Enum with end

declare extern type ImageStretchMode extends Enum with end

declare extern type UIScrollMode extends Enum with end

declare extern type BorderMode extends Enum with end

declare extern type FontWeight extends Enum with end

declare extern type FontStyle extends Enum with end

declare extern type KeyCode extends Enum with end

declare extern type BlendMode extends Enum with end

declare extern type GraphicsPreset extends Enum with end

declare extern type RenderingMethod extends Enum with end

declare extern type ShadowQuality extends Enum with end

declare extern type MsaaScale extends Enum with end

declare extern type SoundAttenuationMode extends Enum with end

declare extern type HorizontalAlignment extends Enum with end

declare extern type VerticalAlignment extends Enum with end

declare extern type TextTrimming extends Enum with end

declare extern type TextureFilter extends Enum with end

declare extern type AddonPermission extends Enum with end

declare extern type CreatorToolMode extends Enum with end

declare Enums: {
	CameraMode: {
		Follow: CameraMode,
		Free: CameraMode,
		Scripted: CameraMode,
	},
	CharacterModelState: {
		Idle: CharacterModelState,
		Walking: CharacterModelState,
		Running: CharacterModelState,
		Jumping: CharacterModelState,
		Climbing: CharacterModelState,
	},
	CharacterAttachment: {
		Head: CharacterAttachment,
		UpperTorso: CharacterAttachment,
		LowerTorso: CharacterAttachment,
		ShoulderLeft: CharacterAttachment,
		ShoulderRight: CharacterAttachment,
		ElbowLeft: CharacterAttachment,
		ElbowRight: CharacterAttachment,
		HandLeft: CharacterAttachment,
		HandRight: CharacterAttachment,
		LegLeft: CharacterAttachment,
		LegRight: CharacterAttachment,
		KneeLeft: CharacterAttachment,
		KneeRight: CharacterAttachment,
		FootLeft: CharacterAttachment,
		FootRight: CharacterAttachment,
	},
	HttpRequestMethod: {
		Get: HttpRequestMethod,
		Post: HttpRequestMethod,
		Put: HttpRequestMethod,
		Delete: HttpRequestMethod,
		Patch: HttpRequestMethod,
	},
	GrabbablePermissionMode: {
		None: GrabbablePermissionMode,
		Everyone: GrabbablePermissionMode,
		Scripted: GrabbablePermissionMode,
	},
	UIMode: {
		Default: UIMode,
		GUI3D: UIMode,
	},
	SkyboxPreset: {
		Day1: SkyboxPreset,
		Day2: SkyboxPreset,
		Day3: SkyboxPreset,
		Day4: SkyboxPreset,
		Day5: SkyboxPreset,
		Day6: SkyboxPreset,
		Day7: SkyboxPreset,
		Morning1: SkyboxPreset,
		Morning2: SkyboxPreset,
		Morning3: SkyboxPreset,
		Morning4: SkyboxPreset,
		Night1: SkyboxPreset,
		Night2: SkyboxPreset,
		Night3: SkyboxPreset,
		Night4: SkyboxPreset,
		Night5: SkyboxPreset,
		Sunset1: SkyboxPreset,
		Sunset2: SkyboxPreset,
		Sunset3: SkyboxPreset,
		Sunset4: SkyboxPreset,
		Sunset5: SkyboxPreset,
	},
	AmbientSource: {
		Skybox: AmbientSource,
		Color: AmbientSource,
	},
	MeshCollisionType: {
		Bounds: MeshCollisionType,
		Convex: MeshCollisionType,
		Exact: MeshCollisionType,
	},
	PartShape: {
		Brick: PartShape,
		Sphere: PartShape,
		Cylinder: PartShape,
		Cone: PartShape,
		Wedge: PartShape,
		Corner: PartShape,
		Bevel: PartShape,
		Concave: PartShape,
		Truss: PartShape,
		Frame: PartShape,
		Octant: PartShape,
		Torus: PartShape,
		BeveledCorner: PartShape,
		ConcaveCorner: PartShape,
		TriangleCorner: PartShape,
		TriangleConcaveCorner: PartShape,
	},
	PartMaterial: {
		SmoothPlastic: PartMaterial,
		Brick: PartMaterial,
		Concrete: PartMaterial,
		Dirt: PartMaterial,
		Fabric: PartMaterial,
		Grass: PartMaterial,
		Ice: PartMaterial,
		Marble: PartMaterial,
		Metal: PartMaterial,
		MetalGrid: PartMaterial,
		MetalPlate: PartMaterial,
		Neon: PartMaterial,
		Planks: PartMaterial,
		Plastic: PartMaterial,
		Plywood: PartMaterial,
		RustyIron: PartMaterial,
		Sand: PartMaterial,
		Sandstone: PartMaterial,
		Snow: PartMaterial,
		Stone: PartMaterial,
		Wood: PartMaterial,
	},
	ParticleSimulationSpace: {
		Local: ParticleSimulationSpace,
		World: ParticleSimulationSpace,
	},
	ParticleEmissionShape: {
		Point: ParticleEmissionShape,
		Sphere: ParticleEmissionShape,
		SphereSurface: ParticleEmissionShape,
		Box: ParticleEmissionShape,
		Ring: ParticleEmissionShape,
	},
	ParticleOrientation: {
		FaceCamera: ParticleOrientation,
		FaceCameraFixedY: ParticleOrientation,
	},
	ForceMode: {
		Force: ForceMode,
		Acceleration: ForceMode,
		Impulse: ForceMode,
		VelocityChange: ForceMode,
	},
	PlayerMovementMode: {
		Default: PlayerMovementMode,
		Scripted: PlayerMovementMode,
	},
	PlayerRotationMode: {
		Automatic: PlayerRotationMode,
		CameraLocked: PlayerRotationMode,
		Movement: PlayerRotationMode,
		MovementCtrlLockOnly: PlayerRotationMode,
	},
	BuiltInAudioPreset: {
		Jump: BuiltInAudioPreset,
		Explosion: BuiltInAudioPreset,
	},
	FontPreset: {
		SourceSans: FontPreset,
		PressStart2P: FontPreset,
		Montserrat: FontPreset,
		RobotoMono: FontPreset,
		Rubik: FontPreset,
		Poppins: FontPreset,
		Domine: FontPreset,
		Fredoka: FontPreset,
		ComicNeue: FontPreset,
		Orbitron: FontPreset,
		Papyrus: FontPreset,
		ComicSansMS: FontPreset,
		JetBrainsMono: FontPreset,
	},
	GradientImageFill: {
		Linear: GradientImageFill,
		Radial: GradientImageFill,
		Square: GradientImageFill,
	},
	MeshAnimationType: {
		Normal: MeshAnimationType,
		Looped: MeshAnimationType,
		PingPong: MeshAnimationType,
		OneShot: MeshAnimationType,
		OneShotImpluse: MeshAnimationType,
	},
	ImageType: {
		Asset: ImageType,
		AssetThumbnail: ImageType,
		WorldThumbnail: ImageType,
		UserAvatar: ImageType,
		UserAvatarHeadshot: ImageType,
		GuildIcon: ImageType,
		GuildBanner: ImageType,
		PlaceIcon: ImageType,
	},
	CtrlLockCursor: {
		None: CtrlLockCursor,
		Chevron: CtrlLockCursor,
		Stereotypical: CtrlLockCursor,
		StereotypicalDot: CtrlLockCursor,
		Tactical: CtrlLockCursor,
		Dot: CtrlLockCursor,
		TacticalDot: CtrlLockCursor,
		Plus: CtrlLockCursor,
		X: CtrlLockCursor,
	},
	ClientPlatform: {
		Desktop: ClientPlatform,
		Mobile: ClientPlatform,
		VR: ClientPlatform,
	},
	TweenTransition: {
		Linear: TweenTransition,
		Sine: TweenTransition,
		Quint: TweenTransition,
		Quart: TweenTransition,
		Quad: TweenTransition,
		Expo: TweenTransition,
		Elastic: TweenTransition,
		Cubic: TweenTransition,
		Circ: TweenTransition,
		Bounce: TweenTransition,
		Back: TweenTransition,
		Spring: TweenTransition,
	},
	TweenDirection: {
		In: TweenDirection,
		Out: TweenDirection,
		InOut: TweenDirection,
		OutIn: TweenDirection,
	},
	DominantAxis: {
		Width: DominantAxis,
		Height: DominantAxis,
	},
	AspectRatioScaleType: {
		FitContainer: AspectRatioScaleType,
		FitMaxSize: AspectRatioScaleType,
		NoLimit: AspectRatioScaleType,
	},
	UIMaskMode: {
		Disabled: UIMaskMode,
		ClipOnly: UIMaskMode,
		ClipAndDraw: UIMaskMode,
	},
	UILayoutAlignment: {
		Start: UILayoutAlignment,
		Center: UILayoutAlignment,
		End: UILayoutAlignment,
	},
	ImageStretchMode: {
		Stretch: ImageStretchMode,
		Centered: ImageStretchMode,
		Covered: ImageStretchMode,
	},
	UIScrollMode: {
		Disabled: UIScrollMode,
		Auto: UIScrollMode,
		AlwaysShow: UIScrollMode,
		NeverShow: UIScrollMode,
	},
	BorderMode: {
		Inset: BorderMode,
		Middle: BorderMode,
		Outline: BorderMode,
	},
	FontWeight: {
		Thin: FontWeight,
		ExtraLight: FontWeight,
		Light: FontWeight,
		Regular: FontWeight,
		Medium: FontWeight,
		SemiBold: FontWeight,
		Bold: FontWeight,
		ExtraBold: FontWeight,
		Black: FontWeight,
	},
	FontStyle: {
		Normal: FontStyle,
		Italic: FontStyle,
	},
	KeyCode: {
		None: KeyCode,
		Space: KeyCode,
		Exclam: KeyCode,
		QuotedBl: KeyCode,
		Numbersign: KeyCode,
		Dollar: KeyCode,
		Percent: KeyCode,
		Ampersand: KeyCode,
		Apostrophe: KeyCode,
		ParenLeft: KeyCode,
		Parenright: KeyCode,
		Asterisk: KeyCode,
		Plus: KeyCode,
		Comma: KeyCode,
		Minus: KeyCode,
		Period: KeyCode,
		Slash: KeyCode,
		Key0: KeyCode,
		Key1: KeyCode,
		Key2: KeyCode,
		Key3: KeyCode,
		Key4: KeyCode,
		Key5: KeyCode,
		Key6: KeyCode,
		Key7: KeyCode,
		Key8: KeyCode,
		Key9: KeyCode,
		Colon: KeyCode,
		Semicolon: KeyCode,
		Less: KeyCode,
		Equal: KeyCode,
		Greater: KeyCode,
		Question: KeyCode,
		At: KeyCode,
		A: KeyCode,
		B: KeyCode,
		C: KeyCode,
		D: KeyCode,
		E: KeyCode,
		F: KeyCode,
		G: KeyCode,
		H: KeyCode,
		I: KeyCode,
		J: KeyCode,
		K: KeyCode,
		L: KeyCode,
		M: KeyCode,
		N: KeyCode,
		O: KeyCode,
		P: KeyCode,
		Q: KeyCode,
		R: KeyCode,
		S: KeyCode,
		T: KeyCode,
		U: KeyCode,
		V: KeyCode,
		W: KeyCode,
		X: KeyCode,
		Y: KeyCode,
		Z: KeyCode,
		BracketLeft: KeyCode,
		Backslash: KeyCode,
		BracketRight: KeyCode,
		Asciicircum: KeyCode,
		Underscore: KeyCode,
		QuoteLeft: KeyCode,
		BraceLeft: KeyCode,
		Bar: KeyCode,
		BraceRight: KeyCode,
		Asciitilde: KeyCode,
		Yen: KeyCode,
		Section: KeyCode,
		GamepadA: KeyCode,
		GamepadB: KeyCode,
		GamepadX: KeyCode,
		GamepadY: KeyCode,
		GamepadBack: KeyCode,
		GamepadGuide: KeyCode,
		GamepadStart: KeyCode,
		GamepadLeftStick: KeyCode,
		GamepadRightStick: KeyCode,
		GamepadLeftShoulder: KeyCode,
		GamepadRightShoulder: KeyCode,
		GamepadDpadUp: KeyCode,
		GamepadDpadDown: KeyCode,
		GamepadDpadLeft: KeyCode,
		GamepadDpadRight: KeyCode,
		GamepadPaddle1: KeyCode,
		GamepadPaddle2: KeyCode,
		GamepadPaddle3: KeyCode,
		GamepadPaddle4: KeyCode,
		GamepadTouchpad: KeyCode,
		MouseLeft: KeyCode,
		MouseRight: KeyCode,
		MouseMiddle: KeyCode,
		MouseWheelUp: KeyCode,
		MouseWheelDown: KeyCode,
		MouseWheelLeft: KeyCode,
		MouseWheelRight: KeyCode,
		MouseXbutton1: KeyCode,
		MouseXbutton2: KeyCode,
		GamepadAxisLeftX: KeyCode,
		GamepadAxisLeftY: KeyCode,
		GamepadAxisRightX: KeyCode,
		GamepadAxisRightY: KeyCode,
		GamepadAxisTriggerLeft: KeyCode,
		GamepadAxisTriggerRight: KeyCode,
		MouseAxisX: KeyCode,
		MouseAxisY: KeyCode,
		Special: KeyCode,
		Escape: KeyCode,
		Tab: KeyCode,
		Backtab: KeyCode,
		Backspace: KeyCode,
		Enter: KeyCode,
		KpEnter: KeyCode,
		Insert: KeyCode,
		Delete: KeyCode,
		Left: KeyCode,
		Up: KeyCode,
		Right: KeyCode,
		Down: KeyCode,
		PageUp: KeyCode,
		PageDown: KeyCode,
		Shift: KeyCode,
		Ctrl: KeyCode,
		Meta: KeyCode,
		Alt: KeyCode,
		CapsLock: KeyCode,
		NumLock: KeyCode,
		ScrollLock: KeyCode,
		F1: KeyCode,
		F2: KeyCode,
		F3: KeyCode,
		F4: KeyCode,
		F5: KeyCode,
		F6: KeyCode,
		F7: KeyCode,
		F8: KeyCode,
		F9: KeyCode,
		F10: KeyCode,
		F11: KeyCode,
		F12: KeyCode,
		Menu: KeyCode,
		Hyper: KeyCode,
		KpMultiply: KeyCode,
		KpDivide: KeyCode,
		KpSubtract: KeyCode,
		KpPeriod: KeyCode,
		KpAdd: KeyCode,
		Kp0: KeyCode,
		Kp1: KeyCode,
		Kp2: KeyCode,
		Kp3: KeyCode,
		Kp4: KeyCode,
		Kp5: KeyCode,
		Kp6: KeyCode,
		Kp7: KeyCode,
		Kp8: KeyCode,
		Kp9: KeyCode,
		Unknown: KeyCode,
	},
	BlendMode: {
		Mix: BlendMode,
		Add: BlendMode,
		Subtract: BlendMode,
		Multiply: BlendMode,
	},
	GraphicsPreset: {
		Low: GraphicsPreset,
		Medium: GraphicsPreset,
		High: GraphicsPreset,
		Ultra: GraphicsPreset,
		Photo: GraphicsPreset,
		Custom: GraphicsPreset,
	},
	RenderingMethod: {
		Standard: RenderingMethod,
		Performance: RenderingMethod,
		Compatibility: RenderingMethod,
		Auto: RenderingMethod,
	},
	ShadowQuality: {
		Off: ShadowQuality,
		Low: ShadowQuality,
		Medium: ShadowQuality,
		High: ShadowQuality,
		Ultra: ShadowQuality,
	},
	MsaaScale: {
		Disabled: MsaaScale,
		X2: MsaaScale,
		X4: MsaaScale,
		X8: MsaaScale,
	},
	SoundAttenuationMode: {
		Disabled: SoundAttenuationMode,
		Linear: SoundAttenuationMode,
		Squared: SoundAttenuationMode,
		Logarithmic: SoundAttenuationMode,
	},
	HorizontalAlignment: {
		Left: HorizontalAlignment,
		Center: HorizontalAlignment,
		Right: HorizontalAlignment,
	},
	VerticalAlignment: {
		Top: VerticalAlignment,
		Middle: VerticalAlignment,
		Bottom: VerticalAlignment,
	},
	TextTrimming: {
		None: TextTrimming,
		Character: TextTrimming,
		Word: TextTrimming,
		CharacterEllipsis: TextTrimming,
		WordEllipsis: TextTrimming,
	},
	TextureFilter: {
		Nearest: TextureFilter,
		NearestNoMipmaps: TextureFilter,
		Linear: TextureFilter,
		LinearNoMipmaps: TextureFilter,
	},
	AddonPermission: {
		IORead: AddonPermission,
		IOWrite: AddonPermission,
	},
	CreatorToolMode: {
		Select: CreatorToolMode,
		Move: CreatorToolMode,
		Rotate: CreatorToolMode,
		Scale: CreatorToolMode,
		Paint: CreatorToolMode,
		Brush: CreatorToolMode,
	},
}

declare extern type ScriptSharedTable with
	function Clear(self)
	function Remove(self, key: string)
	function ClearPrefix(self, prefix: string)
	function ClearSuffix(self, suffix: string)
	function __iter(self): ((any) -> (any, any), nil, nil)
	[any]: any
end

declare extern type Bounds with
	read Center: Vector3
	Size: Vector3
	read Extents: Vector3
	read Start: Vector3
	End: Vector3
	read Volume: number
	function __eq(self, b: Bounds): boolean
	function __tostring(self): string
	function ClosestPoint(self, point: Vector3): Vector3
	function Contains(self, point: Vector3): boolean
	function Encapsulate(self, point: Vector3): Bounds
	function Expand(self, amount: number): Bounds
	function Intersects(self, other: Bounds): boolean
	function Intersection(self, other: Bounds): Bounds
	function SetMinMax(self, min: Vector3, max: Vector3): Bounds
	function Distance(self, point: Vector3): number
	function SqrDistance(self, point: Vector3): number
end

declare Bounds: {
	New: (() -> Bounds) & ((position: Vector3, size: Vector3) -> Bounds),
	ClosestPoint: (bounds: Bounds, point: Vector3) -> Vector3,
	Contains: (bounds: Bounds, point: Vector3) -> boolean,
	Encapsulate: (bounds: Bounds, point: Vector3) -> Bounds,
	Expand: (bounds: Bounds, amount: number) -> Bounds,
	Intersects: (bounds: Bounds, other: Bounds) -> boolean,
	Intersection: (bounds: Bounds, other: Bounds) -> Bounds,
	SetMinMax: (bounds: Bounds, min: Vector3, max: Vector3) -> Bounds,
	Distance: (bounds: Bounds, point: Vector3) -> number,
	SqrDistance: (bounds: Bounds, point: Vector3) -> number,
}

declare extern type Color with
	R: number
	G: number
	B: number
	A: number
	function __add(self, b: Color): Color
	function __sub(self, b: Color): Color
	function __mul(self, b: any): any
	function __eq(self, b: Color): boolean
	function __tostring(self): string
	function ToHex(self): string
	function Lerp(self, b: Color, t: number): Color
end

declare Color: {
	--- @readonly
	Transparent: Color,
	--- @readonly
	Black: Color,
	--- @readonly
	Gray: Color,
	--- @readonly
	White: Color,
	--- @readonly
	Red: Color,
	--- @readonly
	Yellow: Color,
	--- @readonly
	Green: Color,
	--- @readonly
	Cyan: Color,
	--- @readonly
	Blue: Color,
	--- @readonly
	Magenta: Color,
	New: (() -> Color) & ((d: number) -> Color) & ((r: number, g: number, b: number) -> Color) & ((r: number, g: number, b: number, a: number) -> Color),
	Random: () -> Color,
	FromRGB: (r: number, g: number, b: number, a: number?) -> Color,
	FromHex: (hex: string) -> Color,
	ToHex: (c: Color) -> string,
	FromHSV: (h: number, s: number, v: number, a: number?) -> Color,
	Lerp: (a: Color, b: Color, t: number) -> Color,
}

declare extern type Quaternion with
	X: number
	Y: number
	Z: number
	W: number
	function __add(self, b: Quaternion): Quaternion
	function __sub(self, b: Quaternion): Quaternion
	function __sub(self, v: Vector3): Quaternion
	function __mul(self, b: Quaternion): Quaternion
	function __mul(self, v: Vector3): Vector3
	function __eq(self, b: Quaternion): boolean
	function __tostring(self): string
	function Angle(self, b: Quaternion): number
	function Dot(self, b: Quaternion): number
	function ToEuler(self): Vector3
	function Inverse(self): Quaternion
	function Lerp(self, b: Quaternion, t: number): Quaternion
	function LerpUnclamped(self, b: Quaternion, t: number): Quaternion
	function Normalize(self): Quaternion
	function RotateTowards(self, to: Quaternion, maxDegreesDelta: number): Quaternion
	function Slerp(self, b: Quaternion, t: number): Quaternion
	function SlerpUnclamped(self, b: Quaternion, t: number): Quaternion
end

declare Quaternion: {
	--- @readonly
	Identity: Quaternion,
	New: (() -> Quaternion) & ((x: number, y: number, z: number, w: number) -> Quaternion),
	Angle: (a: Quaternion, b: Quaternion) -> number,
	AngleAxis: (angle: number, axis: Vector3) -> Quaternion,
	Dot: (a: Quaternion, b: Quaternion) -> number,
	Euler: ((x: number, y: number, z: number) -> Quaternion) & ((euler: Vector3) -> Quaternion),
	ToEuler: (euler: Quaternion) -> Vector3,
	FromToRotation: (fromDirection: Vector3, toDirection: Vector3) -> Quaternion,
	Inverse: (rotation: Quaternion) -> Quaternion,
	Lerp: (a: Quaternion, b: Quaternion, t: number) -> Quaternion,
	LerpUnclamped: (a: Quaternion, b: Quaternion, t: number) -> Quaternion,
	LookRotation: ((forward: Vector3) -> Quaternion) & ((forward: Vector3, upwards: Vector3) -> Quaternion),
	Normalize: (quaternion: Quaternion) -> Quaternion,
	RotateTowards: (from: Quaternion, to: Quaternion, maxDegreesDelta: number) -> Quaternion,
	Slerp: (a: Quaternion, b: Quaternion, t: number) -> Quaternion,
	SlerpUnclamped: (a: Quaternion, b: Quaternion, t: number) -> Quaternion,
}

declare extern type Variant with
	read Value: any
	function __tostring(self): string
end

declare Variant: {
	New: (() -> Variant) & ((value: any) -> Variant),
}

declare extern type Vector2 with
	X: number
	Y: number
	read Magnitude: number
	read Normalized: Vector2
	read SqrMagnitude: number
	function __add(self, b: Vector2): Vector2
	function __sub(self, b: Vector2): Vector2
	function __mul(self, b: Vector2): Vector2
	function __mul(self, scalar: number): Vector2
	function __div(self, b: number): Vector2
	function __mod(self, b: Vector2): Vector2
	function __unm(self): Vector2
	function __pow(self, b: Vector2): Vector2
	function __eq(self, b: Vector2): boolean
	function __lt(self, b: Vector2): boolean
	function __le(self, b: Vector2): boolean
	function __len(self): number
	function __tostring(self): string
	function Angle(self, to: Vector2): number
	function Cross(self, rhs: Vector2): number
	function Distance(self, b: Vector2): number
	function Dot(self, rhs: Vector2): number
	function Lerp(self, b: Vector2, t: number): Vector2
	function Max(self, rhs: Vector2): Vector2
	function Min(self, rhs: Vector2): Vector2
	function MoveTowards(self, target: Vector2, maxDistanceDelta: number): Vector2
	function Normalize(self): Vector2
	function Project(self, onNormal: Vector2): Vector2
	function Reflect(self, inNormal: Vector2): Vector2
	function Slerp(self, b: Vector2, t: number): Vector2
	function Floor(self): Vector2
	function Ceil(self): Vector2
	function Round(self): Vector2
	function Abs(self): Vector2
	function Sign(self): Vector2
	function Clamp(self, min: Vector2, max: Vector2): Vector2
	function ProjectOnPlane(self, planeNormal: Vector2): Vector2
	function Rotated(self, angle: number): Vector2
	function LimitLength(self, length: number): Vector2
	function RadToDeg(self): Vector2
	function DegToRad(self): Vector2
end

declare Vector2: {
	--- @readonly
	Down: Vector2,
	--- @readonly
	Left: Vector2,
	--- @readonly
	One: Vector2,
	--- @readonly
	Zero: Vector2,
	--- @readonly
	Right: Vector2,
	--- @readonly
	Up: Vector2,
	New: (() -> Vector2) & ((d: number) -> Vector2) & ((x: number, y: number) -> Vector2),
	Angle: (from: Vector2, to: Vector2) -> number,
	Cross: (lhs: Vector2, rhs: Vector2) -> number,
	Distance: (a: Vector2, b: Vector2) -> number,
	Dot: (lhs: Vector2, rhs: Vector2) -> number,
	Lerp: (a: Vector2, b: Vector2, t: number) -> Vector2,
	Max: (lhs: Vector2, rhs: Vector2) -> Vector2,
	Min: (lhs: Vector2, rhs: Vector2) -> Vector2,
	MoveTowards: (current: Vector2, target: Vector2, maxDistanceDelta: number) -> Vector2,
	Normalize: (value: Vector2) -> Vector2,
	Project: (vector: Vector2, onNormal: Vector2) -> Vector2,
	Reflect: (inDirection: Vector2, inNormal: Vector2) -> Vector2,
	Slerp: (a: Vector2, b: Vector2, t: number) -> Vector2,
	Floor: (val: Vector2) -> Vector2,
	Ceil: (val: Vector2) -> Vector2,
	Round: (val: Vector2) -> Vector2,
	Abs: (val: Vector2) -> Vector2,
	Sign: (val: Vector2) -> Vector2,
	Clamp: (val: Vector2, min: Vector2, max: Vector2) -> Vector2,
	ProjectOnPlane: (vector: Vector2, planeNormal: Vector2) -> Vector2,
	Rotated: (val: Vector2, angle: number) -> Vector2,
	LimitLength: (val: Vector2, length: number) -> Vector2,
	RadToDeg: (val: Vector2) -> Vector2,
	DegToRad: (val: Vector2) -> Vector2,
}

declare extern type Vector3 with
	X: number
	Y: number
	Z: number
	read Magnitude: number
	read Normalized: Vector3
	read SqrMagnitude: number
	function __add(self, b: Vector3): Vector3
	function __sub(self, b: Vector3): Vector3
	function __sub(self, q: Quaternion): Vector3
	function __mul(self, b: Vector3): Vector3
	function __mul(self, scalar: number): Vector3
	function __mul(self, q: Quaternion): Vector3
	function __div(self, b: number): Vector3
	function __mod(self, b: Vector3): Vector3
	function __unm(self): Vector3
	function __pow(self, b: Vector3): Vector3
	function __eq(self, b: Vector3): boolean
	function __lt(self, b: Vector3): boolean
	function __le(self, b: Vector3): boolean
	function __len(self): number
	function __tostring(self): string
	function Angle(self, to: Vector3): number
	function Cross(self, rhs: Vector3): Vector3
	function Distance(self, b: Vector3): number
	function Dot(self, rhs: Vector3): number
	function Lerp(self, b: Vector3, t: number): Vector3
	function Max(self, rhs: Vector3): Vector3
	function Min(self, rhs: Vector3): Vector3
	function MoveTowards(self, target: Vector3, maxDistanceDelta: number): Vector3
	function Normalize(self): Vector3
	function Project(self, onNormal: Vector3): Vector3
	function ProjectOnPlane(self, planeNormal: Vector3): Vector3
	function Reflect(self, inNormal: Vector3): Vector3
	function SignedAngle(self, to: Vector3, axis: Vector3): number
	function Slerp(self, b: Vector3, t: number): Vector3
	function Floor(self): Vector3
	function Ceil(self): Vector3
	function Round(self): Vector3
	function Abs(self): Vector3
	function Sign(self): Vector3
	function Rotated(self, axis: Vector3, angle: number): Vector3
	function LimitLength(self, length: number): Vector3
	function Clamp(self, min: Vector3, max: Vector3): Vector3
	function RadToDeg(self): Vector3
	function DegToRad(self): Vector3
end

declare Vector3: {
	--- @readonly
	Forward: Vector3,
	--- @readonly
	Back: Vector3,
	--- @readonly
	Down: Vector3,
	--- @readonly
	Left: Vector3,
	--- @readonly
	One: Vector3,
	--- @readonly
	Zero: Vector3,
	--- @readonly
	Right: Vector3,
	--- @readonly
	Up: Vector3,
	New: (() -> Vector3) & ((d: number) -> Vector3) & ((x: number, y: number) -> Vector3) & ((x: number, y: number, z: number) -> Vector3) & ((v: Vector2) -> Vector3),
	Angle: (from: Vector3, to: Vector3) -> number,
	Cross: (lhs: Vector3, rhs: Vector3) -> Vector3,
	Distance: (a: Vector3, b: Vector3) -> number,
	Dot: (lhs: Vector3, rhs: Vector3) -> number,
	Lerp: (a: Vector3, b: Vector3, t: number) -> Vector3,
	Max: (lhs: Vector3, rhs: Vector3) -> Vector3,
	Min: (lhs: Vector3, rhs: Vector3) -> Vector3,
	MoveTowards: (current: Vector3, target: Vector3, maxDistanceDelta: number) -> Vector3,
	Normalize: (value: Vector3) -> Vector3,
	Project: (vector: Vector3, onNormal: Vector3) -> Vector3,
	ProjectOnPlane: (vector: Vector3, planeNormal: Vector3) -> Vector3,
	Reflect: (inDirection: Vector3, inNormal: Vector3) -> Vector3,
	SignedAngle: (from: Vector3, to: Vector3, axis: Vector3) -> number,
	Slerp: (a: Vector3, b: Vector3, t: number) -> Vector3,
	Floor: (val: Vector3) -> Vector3,
	Ceil: (val: Vector3) -> Vector3,
	Round: (val: Vector3) -> Vector3,
	Abs: (val: Vector3) -> Vector3,
	Sign: (val: Vector3) -> Vector3,
	Rotated: (val: Vector3, axis: Vector3, angle: number) -> Vector3,
	LimitLength: (val: Vector3, length: number) -> Vector3,
	Clamp: (val: Vector3, min: Vector3, max: Vector3) -> Vector3,
	RadToDeg: (val: Vector3) -> Vector3,
	DegToRad: (val: Vector3) -> Vector3,
}

declare extern type NetworkedObject with
	Name: string
	read ClassName: string
	read Shared: ScriptSharedTable
	read NetworkedObjectID: string
	read ObjectID: string
	read ExistInNetwork: boolean
	read PropertyChanged: PTSignal<string>
	read Renamed: PTSignal
	read TreeEntered: PTSignal
	read TreeExited: PTSignal
	read Destroying: PTSignal
	function IsA(self, className: string): boolean
	function Clone(self, parent: NetworkedObject?): NetworkedObject
	function Destroy(self, time: number?)
	function Delete(self, time: number?)
	function __tostring(self): string
end

declare extern type Instance extends NetworkedObject with
	Parent: Instance
	EditableChildren: boolean
	Tags: { string }
	Archivable: boolean
	read ChildAdded: PTSignal<Instance>
	read ChildRemoved: PTSignal<Instance>
	read ChildDeleting: PTSignal<Instance>
	read ChildDeleted: PTSignal<Instance>
	read TagAdded: PTSignal<string>
	read TagRemoved: PTSignal<string>
	function GetDescendants(self): { Instance }
	function FindChild(self, name: string): Instance
	function WaitChild(self, name: string, timeoutSec: number?): Instance
	function FindChildByClass(self, className: string): Instance
	function FindChildWithTag(self, tag: string): Instance
	function FindDescendant(self, path: string): Instance
	function GetChildrenWithTag(self, tag: string): { Instance }
	function GetDescendantsWithTag(self, tag: string): { Instance }
	function FindAncestorByClass(self, className: string): Instance
	function FindChildByIndex(self, index: number): Instance
	function MoveChild(self, child: Instance, index: number)
	function GetChildren(self): { Instance }
	function GetChildrenOfClass(self, className: string): { Instance }
	function IsAncestorOf(self, instance: Instance): boolean
	function IsDescendantOf(self, instance: Instance): boolean
	function IsDescendantOfClass(self, className: string): boolean
	function AddTag(self, tag: string)
	function RemoveTag(self, tag: string)
	function HasTag(self, tag: string): boolean
	function Reparent(self, to: Instance)
	function GetParent(self): Instance
	function SetParent(self, newParent: Instance)
	[any]: any
end

declare Instance: {
	New: (className: string, parent: Instance?) -> Instance,
}

declare extern type Animator extends Instance with
	CurrentAnimation: string
	function PlayAnimation(self, animationKey: string)
	function PlayOneShotAnimation(self, animationKey: string)
	function StopAnimation(self)
	function StopOneShotAnimation(self)
end

declare Animator: {
	New: (parent: NetworkedObject?) -> Animator,
}

declare extern type BindableEvent extends Instance with
	read Invoked: PTSignal
	function Invoke(self, ...: any)
end

declare BindableEvent: {
	New: (parent: NetworkedObject?) -> BindableEvent,
}

declare extern type BodyPosition extends Instance with
	TargetPosition: Vector3
	Force: number
	AcceptanceDistance: number
end

declare BodyPosition: {
	New: (parent: NetworkedObject?) -> BodyPosition,
}

declare extern type BodyRotation extends Instance with
	TargetRotation: Vector3
	Force: number
	AcceptanceAngle: number
	function SetQuaternion(self, quaternion: Quaternion)
end

declare BodyRotation: {
	New: (parent: NetworkedObject?) -> BodyRotation,
}

declare extern type Clothing extends Instance with
	Image: ImageAsset
end

declare Clothing: {
	New: (parent: NetworkedObject?) -> Clothing,
}

declare extern type Dynamic extends Instance with
	Position: Vector3
	Rotation: Vector3
	Size: Vector3
	LocalPosition: Vector3
	LocalRotation: Vector3
	LocalSize: Vector3
	Quaternion: Quaternion
	LocalQuaternion: Quaternion
	Locked: boolean
	read Forward: Vector3
	read Right: Vector3
	read Up: Vector3
	function LookAt(self, target: any)
	function LookAt(self, target: any, up: Vector3)
	function Translate(self, translation: Vector3)
	function RotateAround(self, point: Vector3, axis: Vector3, angle: number)
	function Rotate(self, eulerAngles: Vector3)
	function GetBounds(self): Bounds
end

declare Dynamic: {
	New: (parent: NetworkedObject?) -> Dynamic,
}

declare extern type Accessory extends Dynamic with
	TargetAttachment: CharacterAttachment
end

declare Accessory: {
	New: (parent: NetworkedObject?) -> Accessory,
}

declare extern type Camera extends Dynamic with
	read Forward: Vector3
	Mode: CameraMode
	FOV: number
	ClipThroughWalls: boolean
	MinDistance: number
	MaxDistance: number
	Distance: number
	ScrollSensitivity: number
	Orthographic: boolean
	FollowLerp: boolean
	LerpSpeed: number
	OrthographicSize: number
	Near: number
	Far: number
	PositionOffset: Vector3
	RotationOffset: Vector3
	read IsFirstPerson: boolean
	CanLock: boolean
	SensitivityMultiplier: number
	read Sensitivity: number
	HorizontalSpeed: number
	VerticalSpeed: number
	ScrollLerpSpeed: number
	CtrlLocked: boolean
	AlwaysLocked: boolean
	Target: Dynamic
	read FirstPersonEntered: PTSignal
	read FirstPersonExited: PTSignal
	function IsPositionInView(self, pos: Vector3): boolean
	function IsPositionBehind(self, pos: Vector3): boolean
	function ViewportPointToRay(self, pos: Vector2, ignoreList: { Instance }?, maxDistance: number?): RayResult?
	function ScreenPointToRay(self, pos: Vector2, ignoreList: { Instance }?, maxDistance: number?): RayResult?
	function ViewportToScreenPoint(self, pos: Vector2): Vector2
	function ViewportToWorldPoint(self, pos: Vector2): Vector3
	function WorldToViewportPoint(self, pos: Vector3): Vector2
	function WorldToScreenPoint(self, pos: Vector3): Vector2
	function ScreenToViewportPoint(self, pos: Vector2): Vector2
	function ScreenToWorldPoint(self, pos: Vector2): Vector3
end

declare Camera: {
	New: (parent: NetworkedObject?) -> Camera,
}

declare extern type CharacterModel extends Dynamic with
	CurrentState: CharacterModelState
	CurrentSpeed: number
	Animator: Animator
	function PlayIdle(self)
	function PlayWalk(self)
	function PlayRun(self)
	function PlayJump(self)
	function PlayClimb(self)
	function SetAnimSpeed(self, speed: number)
	function SetState(self, newState: CharacterModelState)
	function GetAttachment(self, attachmentEnum: CharacterAttachment): Dynamic
end

declare CharacterModel: {
	New: (parent: NetworkedObject?) -> CharacterModel,
}

declare extern type PolytorianModel extends CharacterModel with
	HeadColor: Color
	TorsoColor: Color
	LeftArmColor: Color
	RightArmColor: Color
	LeftLegColor: Color
	RightLegColor: Color
	--- @deprecated -- Obsolete, use 'FaceImage' instead
	FaceID: number
	FaceImage: ImageAsset
	BodyMesh: MeshAsset
	read Ragdolling: boolean
	read RagdollPosition: Vector3
	read RagdollRotation: Vector3
	read RagdollStarted: PTSignal
	read RagdollStopped: PTSignal
	function StartRagdoll(self, force: Vector3?)
	function StopRagdoll(self)
	function GetAttachment(self, attachmentEnum: CharacterAttachment): Dynamic
	function LoadAppearance(self, userID: number, loadTool: boolean?)
	function ClearAppearance(self)
end

declare PolytorianModel: {
	New: (parent: NetworkedObject?) -> PolytorianModel,
}

declare extern type Decal extends Dynamic with
	Image: ImageAsset
	Energy: number
	Color: Color
end

declare Decal: {
	New: (parent: NetworkedObject?) -> Decal,
}

declare extern type Explosion extends Dynamic with
	Radius: number
	Force: number
	AffectAnchored: boolean
	Damage: number
	AffectWelds: boolean
	UseEffects: boolean
	AffectPredicate: (...any) -> ...any
	read Touched: PTSignal<Instance>
end

declare Explosion: {
	New: (parent: NetworkedObject?) -> Explosion,
}

declare extern type GUI3D extends Dynamic with
	Shaded: boolean
	FaceCamera: boolean
	Transparent: boolean
	read AbsoluteSize: Vector2
end

declare GUI3D: {
	New: (parent: NetworkedObject?) -> GUI3D,
}

declare extern type Image3D extends Dynamic with
	Image: ImageAsset
	--- @deprecated -- Obsolete, use 'Image' instead
	ImageID: string
	--- @deprecated -- Obsolete, use 'Image' instead
	ImageType: ImageType
	TextureScale: Vector2
	TextureOffset: Vector2
	Color: Color
	CastShadows: boolean
	Shaded: boolean
	FaceCamera: boolean
	DoubleSided: boolean
	TextureFilter: TextureFilter
end

declare Image3D: {
	New: (parent: NetworkedObject?) -> Image3D,
}

declare extern type Light extends Dynamic with
	Enabled: boolean
	Color: Color
	Brightness: number
	LightSize: number
	Specular: number
	Shadows: boolean
end

declare extern type PointLight extends Light with
	Range: number
end

declare PointLight: {
	New: (parent: NetworkedObject?) -> PointLight,
}

declare extern type SpotLight extends Light with
	Range: number
	Angle: number
end

declare SpotLight: {
	New: (parent: NetworkedObject?) -> SpotLight,
}

declare extern type SunLight extends Light with
end

declare extern type Marker3D extends Dynamic with
	Length: number
	AppearOnTop: boolean
	VisibleInDev: boolean
end

declare Marker3D: {
	New: (parent: NetworkedObject?) -> Marker3D,
}

declare extern type Model extends Dynamic with
end

declare Model: {
	New: (parent: NetworkedObject?) -> Model,
}

declare extern type Particles extends Dynamic with
	Playing: boolean
	SpeedScale: number
	Image: ImageAsset
	TextureFilter: TextureFilter
	Color: ColorSeries
	Lifetime: NumberRange
	Amount: number
	Explosiveness: number
	Gravity: Vector3
	VelocityDirection: Vector3
	InitialVelocity: NumberRange
	StartRotation: NumberRange
	AngularVelocity: NumberRange
	AngularVelocityOverLifetime: NumberSeries
	LinearAcceleration: NumberRange
	LinearAccelerationOverLifetime: NumberSeries
	RadialAcceleration: NumberRange
	read RadialAccelerationOverLifetime: NumberSeries
	TangentialAcceleration: NumberRange
	read TangentialAccelerationOverLifetime: NumberSeries
	OrbitalVelocity: NumberRange
	read OrbitalVelocityOverLifetime: NumberSeries
	Damping: NumberRange
	read DampingOverLifetime: NumberSeries
	ScaleOverVelocity: NumberRange
	read ScaleOverVelocityCurve: NumberSeries
	TurbulenceEnabled: boolean
	TurbulenceInfluence: NumberRange
	read TurbulenceOverLifetime: NumberSeries
	TurbulenceNoiseScale: number
	TurbulenceNoiseStrength: number
	TurbulenceNoiseSpeed: Vector3
	Spread: number
	Flatness: number
	Scale: NumberRange
	ScaleOverLifetime: NumberSeries
	HueVariation: NumberRange
	BlendMode: BlendMode
	Shaded: boolean
	EmissionShape: ParticleEmissionShape
	EmissionShapeScale: Vector3
	SimulationSpace: ParticleSimulationSpace
	Orientation: ParticleOrientation
	read IsPlaying: boolean
	read IsPaused: boolean
	read IsStopped: boolean
	function Play(self)
	function Pause(self)
	function Stop(self)
	function Clear(self)
	function Emit(self, count: number)
end

declare Particles: {
	New: (parent: NetworkedObject?) -> Particles,
}

declare extern type Physical extends Dynamic with
	Anchored: boolean
	CanCollide: boolean
	CollisionLayers: number
	CollisionMask: number
	Velocity: Vector3
	AngularVelocity: Vector3
	read Touched: PTSignal<Physical>
	read TouchEnded: PTSignal<Physical>
	read MouseEnter: PTSignal
	read MouseExit: PTSignal
	read Clicked: PTSignal<Player>
	function SetNetworkAuthority(self, plr: Player)
	function SetCollisionLayer(self, layer: number, value: boolean)
	function SetCollisionMask(self, layer: number, value: boolean)
	function GetCollisionLayer(self, layer: number): boolean
	function GetCollisionMask(self, layer: number): boolean
	function GetTouching(self): { Physical }
	function MovePosition(self, position: Vector3)
	function MoveRotation(self, rotation: Vector3)
	function AddForce(self, force: Vector3, mode: ForceMode?)
	function AddTorque(self, force: Vector3, mode: ForceMode?)
	function AddForceAtPosition(self, force: Vector3, position: Vector3, mode: ForceMode?)
	function AddRelativeForce(self, force: Vector3, mode: ForceMode?)
	function AddRelativeTorque(self, torque: Vector3, mode: ForceMode?)
end

declare extern type InteractionPrompt extends Physical with
	UIMode: UIMode
	Enabled: boolean
	HideByDefault: boolean
	Title: string
	Subtitle: string
	Scale: number
	MaxDistance: number
	LineOfSightThreshold: number
	ActivationTime: number
	UseParentForVisibility: boolean
	RequireFacing: boolean
	HiddenFor: { Player }
	Progress: number
	read Interacted: PTSignal<Player>
	function HideFor(self, plr: Player)
	function ShowFor(self, plr: Player)
end

declare InteractionPrompt: {
	New: (parent: NetworkedObject?) -> InteractionPrompt,
}

declare extern type NPC extends Physical with
	Velocity: Vector3
	--- @deprecated -- Obsolete, use 'Character.HeadColor' instead
	HeadColor: Color
	--- @deprecated -- Obsolete, use 'Character.TorsoColor' instead
	TorsoColor: Color
	--- @deprecated -- Obsolete, use 'Character.LeftArmColor' instead
	LeftArmColor: Color
	--- @deprecated -- Obsolete, use 'Character.RightArmColor' instead
	RightArmColor: Color
	--- @deprecated -- Obsolete, use 'Character.LeftLegColor' instead
	LeftLegColor: Color
	--- @deprecated -- Obsolete, use 'Character.RightLegColor' instead
	RightLegColor: Color
	--- @deprecated -- Obsolete, use 'Character.FaceImage' instead
	FaceID: number
	SeatOffset: Vector3
	Health: number
	MaxHealth: number
	JumpPower: number
	WalkSpeed: number
	UseNametag: boolean
	NametagOffset: Vector3
	NametagVisibleRadius: number
	DisplayName: string
	JumpSound: Sound
	read IsSitting: boolean
	read IsDead: boolean
	read HoldingTool: Tool
	read SittingIn: Seat
	read Character: CharacterModel
    Vertical: Vector3
	MoveTarget: Dynamic
	read IsOnGround: boolean
	read IsOnCeiling: boolean
	read NavDestinationDistance: number
	read NavDestinationReached: boolean
	read NavDestinationValid: boolean
	read Died: PTSignal
	read HealthChanged: PTSignal<number, number>
	read Jumped: PTSignal
	read LeftGround: PTSignal
	read Seated: PTSignal<Seat>
	read Unseated: PTSignal<Seat>
	read Landed: PTSignal
	read NavFinished: PTSignal
	function Move(self, velo: Vector3)
	function Kill(self)
	function TryStepUp(self): boolean
	function Jump(self)
	function Sit(self, seat: Seat)
	function Unsit(self, addForce: boolean?)
	function EquipTool(self, tool: Tool)
	function DropTool(self)
	function LoadAppearance(self, userID: number)
	function ClearAppearance(self)
	function SetNavDestination(self, pos: Vector3)
	function Respawn(self)
	function TakeDamage(self, dmg: number)
	function Heal(self, amount: number)
end

declare NPC: {
	New: (parent: NetworkedObject?) -> NPC,
}

declare extern type Player extends NPC with
	read UserID: number
	CanMove: boolean
	SprintSpeed: number
	Stamina: number
	MaxStamina: number
	UseStamina: boolean
	StaminaRegen: number
	StaminaBurn: number
	RespawnTime: number
	KeepInventory: boolean
	UseHeadTurning: boolean
	UseBubbleChat: boolean
	AutoLoadAppearance: boolean
	AllowAnimationWhileMoving: boolean
	Team: Team
	MovementMode: PlayerMovementMode
	RotationMode: PlayerRotationMode
	read Grabbing: Physical
	read NetworkPing: number
	read IsAdmin: boolean
	read IsCreator: boolean
	read UserRoleClass: string
	ChatColor: Color
	--- @deprecated -- Obsolete, use 'Input.IsInputFocused' instead
	read IsInputFocused: boolean
	read IsLocal: boolean
	read IsClimbing: boolean
	read ClimbingTruss: Truss
	read UserPlatform: ClientPlatform
	read Inventory: Inventory
	--- @deprecated -- Obsolete, use 'Inventory' instead
	read Backpack: Inventory
	read Chatted: PTSignal<string>
	read StatChanged: PTSignal<Stat, any>
	read TeamChanged: PTSignal<Team>
	read Respawned: PTSignal
	read Grabbed: PTSignal<Physical>
	read Ungrabbed: PTSignal<Physical>
	function Jump(self)
	function Kick(self, reason: string)
	@[deprecated { use = "PurchasesService.OwnsItemAsync" }]
	function OwnsItem(self, assetId: number, callback: (...any) -> ())
	function UnequipTool(self)
	function Respawn(self)
	function ResetAppearance(self)
end

declare extern type RigidBody extends Physical with
	Velocity: Vector3
	AngularVelocity: Vector3
	GravityScale: number
	--- @deprecated -- Obsolete, use 'GravityScale' instead
	UseGravity: boolean
	Mass: number
	Friction: number
	Drag: number
	AngularDrag: number
	Bounciness: number
	LockRotation: boolean
end

declare RigidBody: {
	New: (parent: NetworkedObject?) -> RigidBody,
}

declare extern type Entity extends RigidBody with
	Color: Color
	CastShadows: boolean
	IsSpawn: boolean
end

declare extern type Mesh extends Entity with
	Asset: MeshAsset
	--- @deprecated -- Obsolete, use 'Asset' instead
	AssetID: number
	IncludeOffset: boolean
	CollisionType: MeshCollisionType
	TextureFilter: TextureFilter
	PlayAnimationOnStart: boolean
	UsePartColor: boolean
	Color: Color
	CastShadows: boolean
	read CurrentAnimation: string
	read IsAnimationPlaying: boolean
	read Loading: boolean
	read Loaded: PTSignal
	function PlayAnimation(self, animationName: string, speed: number?, loop: boolean?)
	function StopAnimation(self, animationName: string?)
	function GetAnimations(self): { string }
	function GetAnimationInfo(self): { MeshAnimationInfo }
end

declare Mesh: {
	New: (parent: NetworkedObject?) -> Mesh,
}

declare extern type Part extends Entity with
	Shape: PartShape
	Material: PartMaterial
	Color: Color
	CastShadows: boolean
end

declare Part: {
	New: (parent: NetworkedObject?) -> Part,
}

declare extern type Seat extends Part with
	Occupant: NPC
	CanPlayerSit: boolean
	CanNPCSit: boolean
	SitDirectionLocked: boolean
	read Sat: PTSignal<NPC>
	read Vacated: PTSignal<NPC>
end

declare Seat: {
	New: (parent: NetworkedObject?) -> Seat,
}

declare extern type Truss extends Part with
	ClimbSpeed: number
	Climbable: boolean
end

declare Truss: {
	New: (parent: NetworkedObject?) -> Truss,
}

declare extern type Tool extends RigidBody with
	Droppable: boolean
	IconImage: ImageAsset
	DropEquipCooldown: number
	Holder: NPC
	read Equipped: PTSignal
	read Unequipped: PTSignal
	read Activated: PTSignal
	read Deactivated: PTSignal
	function Activate(self)
	function Deactivate(self)
	function PlayAnimation(self, animationName: string)
end

declare Tool: {
	New: (parent: NetworkedObject?) -> Tool,
}

declare extern type Sound extends Dynamic with
	Audio: AudioAsset
	--- @deprecated -- Obsolete, use 'Audio' instead
	SoundID: number
	Volume: number
	Pitch: number
	Pan: number
	Autoplay: boolean
	Loop: boolean
	LoopStart: number
	PlayInWorld: boolean
	Paused: boolean
	MaxDistance: number
	AttenuationMode: SoundAttenuationMode
	Time: number
	read Playing: boolean
	read Loading: boolean
	read Length: number
	read Loaded: PTSignal
	read Finished: PTSignal
	function Play(self)
	function PlayOneShot(self, volume: number?)
	function Pause(self)
	function Stop(self)
	function GetPeakVolume(self): number
end

declare Sound: {
	New: (parent: NetworkedObject?) -> Sound,
}

declare extern type Text3D extends Dynamic with
	Text: string
	FontSize: number
	Color: Color
	OutlineWidth: number
	OutlineColor: Color
	FaceCamera: boolean
	HorizontalAlignment: HorizontalAlignment
	VerticalAlignment: VerticalAlignment
	FontAsset: FontAsset
	--- @deprecated -- Obsolete, use 'FontAsset' instead
	Font: FontPreset
	UseRichText: boolean
	Shaded: boolean
end

declare Text3D: {
	New: (parent: NetworkedObject?) -> Text3D,
}

declare extern type VoiceBox extends Dynamic with
	function Speak(self, msg: string)
end

declare VoiceBox: {
	New: (parent: NetworkedObject?) -> VoiceBox,
}

declare extern type Environment extends Instance with
	CurrentCamera: Camera
	Gravity: Vector3
	PartDestroyHeight: number
	AutoGenerateNavMesh: boolean
	--- @deprecated -- Obsolete, use 'Lighting.Skybox' instead
	Skybox: SkyboxPreset
	--- @deprecated -- Obsolete, use 'Lighting.FogEnabled' instead
	FogEnabled: boolean
	--- @deprecated -- Obsolete, use 'Lighting.FogColor' instead
	FogColor: Color
	--- @deprecated -- Obsolete, use 'Lighting.FogStartDistance' instead
	FogStartDistance: number
	--- @deprecated -- Obsolete, use 'Lighting.FogEndDistance' instead
	FogEndDistance: number
	function Raycast(self, origin: Vector3, direction: Vector3, maxDistance: number?, ignoreList: { Instance }?): RayResult?
	function RaycastAll(self, origin: Vector3, direction: Vector3, maxDistance: number?, ignoreList: { Instance }?): { RayResult }
	function OverlapSphere(self, origin: Vector3, radius: number, ignoreList: { Instance }?): { Instance }
	function OverlapBox(self, pos: Vector3, size: Vector3, rot: Vector3, ignoreList: { Instance }?): { Instance }
	@[deprecated { use = "Explosion.New" }]
	function CreateExplosion(self, position: Vector3, radius: number?, force: number?, affectAnchored: boolean?, callback: (...any) -> ()?, damage: number?)
	function RebuildNavMesh(self)
	function GetPointOnNavMesh(self, toPoint: Vector3): Vector3
end

declare extern type Folder extends Instance with
end

declare Folder: {
	New: (parent: NetworkedObject?) -> Folder,
}

declare extern type Grabbable extends Instance with
	Force: number
	MaxRange: number
	MaxGrabbableRange: number
	UseDragForce: boolean
	PermissionMode: GrabbablePermissionMode
	read Dragger: Player
	PermissionPredicate: (...any) -> ...any
	read Grabbed: PTSignal<Player>
	read Released: PTSignal<Player>
end

declare Grabbable: {
	New: (parent: NetworkedObject?) -> Grabbable,
}

declare extern type GUI extends Instance with
	Visible: boolean
	ZIndex: number
	AvoidCoreUI: boolean
end

declare GUI: {
	New: (parent: NetworkedObject?) -> GUI,
}

declare extern type HiddenBase extends Instance with
end

declare extern type Hidden extends HiddenBase with
end

declare extern type Inventory extends HiddenBase with
end

declare extern type PlayerDefaults extends HiddenBase with
	MaxHealth: number
	WalkSpeed: number
	SprintSpeed: number
	JumpPower: number
	RespawnTime: number
	ChatColor: Color
	ChatColorsEnabled: boolean
	CanMove: boolean
	StaminaBurn: number
	UseStamina: boolean
	StaminaEnabled: boolean
	Stamina: number
	MaxStamina: number
	StaminaRegen: number
	KeepInventory: boolean
	UseHeadTurning: boolean
	UseBubbleChat: boolean
	AutoLoadAppearance: boolean
	LoadAppearanceTools: boolean
	MovementMode: PlayerMovementMode
	function LoadDefaults(self)
end

declare extern type ServerHidden extends HiddenBase with
end

declare extern type Temporary extends ServerHidden with
end

declare extern type Lighting extends Instance with
	Skybox: SkyboxPreset
	AmbientSource: AmbientSource
	AmbientColor: Color
	FogEnabled: boolean
	FogColor: Color
	FogStartDistance: number
	FogEndDistance: number
	--- @deprecated -- Obsolete, use 'SunLight.Brightness' instead
	SunBrightness: number
	--- @deprecated -- Obsolete, use 'SunLight.Color' instead
	SunColor: Color
	--- @deprecated -- Obsolete, use 'SunLight.Shadows' instead
	Shadows: boolean
end

declare extern type LightingModifier extends Instance with
end

declare extern type ColorAdjustModifier extends LightingModifier with
	Brightness: number
	Contrast: number
	Saturation: number
	TintColor: Color
end

declare ColorAdjustModifier: {
	New: (parent: NetworkedObject?) -> ColorAdjustModifier,
}

declare extern type MissingInstance extends Instance with
end

declare extern type NetworkEvent extends Instance with
	Reliable: boolean
	read InvokedServer: PTSignal<Player, NetMessage>
	read InvokedClient: PTSignal<NetMessage>
	function InvokeServer(self, msg: NetMessage?, _: any?)
	function InvokeClient(self, msg: NetMessage?, player: Player?)
	function InvokeClients(self, msg: NetMessage?)
end

declare NetworkEvent: {
	New: (parent: NetworkedObject?) -> NetworkEvent,
}

declare extern type PlayerGUI extends Instance with
end

declare extern type Players extends Instance with
	read LocalPlayer: Player
	PlayerCollisionEnabled: boolean
	UseServerAuthority: boolean
	read PlayersCount: number
	read PlayerAdded: PTSignal<Player>
	read PlayerRemoved: PTSignal<Player>
	function GetPlayers(self): { Player }
	function GetPlayer(self, username: string): Player
	function GetPlayerByID(self, userID: number): Player
end

declare extern type Script extends Instance with
	Source: string
	IsEnabled: boolean
	LinkedScript: FileLinkAsset
	Compatibility: boolean
	function Call(self, funcName: string, ...: any)
	function CallAsync(self, funcName: string, ...: any)
	function LinkWithScriptFile(self, scriptPath: string)
end

declare extern type ClientScript extends Script with
end

declare ClientScript: {
	New: (parent: NetworkedObject?) -> ClientScript,
}

declare extern type ModuleScript extends Script with
end

declare ModuleScript: {
	New: (parent: NetworkedObject?) -> ModuleScript,
}

declare extern type ServerScript extends Script with
end

declare ServerScript: {
	New: (parent: NetworkedObject?) -> ServerScript,
}

declare extern type Sky extends Instance with
end

declare extern type GradientSky extends Sky with
	SunDiscColor: Color
	SunDiscMultiplier: number
	SunDiscExponent: number
	SunHaloColor: Color
	SunHaloExponent: number
	SunHaloContribution: number
	HorizonLineColor: Color
	HorizonLineExponent: number
	HorizonLineContribution: number
	SkyGradientTop: Color
	SkyGradientBottom: Color
	SkyGradientExponent: number
end

declare GradientSky: {
	New: (parent: NetworkedObject?) -> GradientSky,
}

declare extern type ImageSky extends Sky with
	TopImage: ImageAsset
	BottomImage: ImageAsset
	LeftImage: ImageAsset
	RightImage: ImageAsset
	FrontImage: ImageAsset
	BackImage: ImageAsset
	TextureFilter: TextureFilter
	--- @deprecated -- Obsolete, use 'TopImage' instead
	TopId: number
	--- @deprecated -- Obsolete, use 'BottomImage' instead
	BottomId: number
	--- @deprecated -- Obsolete, use 'LeftImage' instead
	LeftId: number
	--- @deprecated -- Obsolete, use 'RightImage' instead
	RightId: number
	--- @deprecated -- Obsolete, use 'FrontImage' instead
	FrontId: number
	--- @deprecated -- Obsolete, use 'BackImage' instead
	BackId: number
end

declare ImageSky: {
	New: (parent: NetworkedObject?) -> ImageSky,
}

declare extern type ProceduralSky extends Sky with
	SunSize: number
	SkyTint: Color
	HorizonColor: Color
	GroundColor: Color
	Exposure: number
end

declare ProceduralSky: {
	New: (parent: NetworkedObject?) -> ProceduralSky,
}

declare extern type Stat extends Instance with
	DisplayName: string
	Visible: boolean
	function GetDisplayName(self): string
	function Set(self, player: Player, val: number)
	function Set(self, player: Player, val: string)
	function Get(self, player: Player): any
	function GetTotalForTeam(self, team: Team): number
	function GetDisplayValue(self, plr: Player): string
end

declare Stat: {
	New: (parent: NetworkedObject?) -> Stat,
}

declare extern type Stats extends Instance with
	function GetStats(self): { Stat }
	function GetVisibleStats(self): { Stat }
end

declare extern type Team extends Instance with
	DisplayName: string
	Color: Color
	function GetDisplayName(self): string
	function GetPlayers(self): { Player }
end

declare Team: {
	New: (parent: NetworkedObject?) -> Team,
}

declare extern type Teams extends Instance with
	function GetTeams(self): { Team }
end

declare extern type UIAspectRatioRestraint extends Instance with
	DominantAxis: DominantAxis
	ScaleType: AspectRatioScaleType
	AspectRatio: number
end

declare UIAspectRatioRestraint: {
	New: (parent: NetworkedObject?) -> UIAspectRatioRestraint,
}

declare extern type UICorner extends Instance with
	CornerRadius: UIScale
	TopLeftRadius: UIScale
	TopRightRadius: UIScale
	BottomLeftRadius: UIScale
	BottomRightRadius: UIScale
end

declare UICorner: {
	New: (parent: NetworkedObject?) -> UICorner,
}

declare extern type UIField extends Instance with
	PositionOffset: Vector2
	PositionRelative: Vector2
	Rotation: number
	SizeOffset: Vector2
	SizeRelative: Vector2
	ClipDescendants: boolean
	PivotPoint: Vector2
	Scale: Vector2
	Visible: boolean
	MaskMode: UIMaskMode
	IgnoreMouse: boolean
	ZIndex: number
	read AbsolutePosition: Vector2
	read AbsoluteSize: Vector2
	read IsVisibleInTree: boolean
	read MouseEnter: PTSignal
	read MouseExit: PTSignal
	read MouseDown: PTSignal
	read MouseUp: PTSignal
	read TransformChanged: PTSignal
	read VisibilityChanged: PTSignal
end

declare UIField: {
	New: (parent: NetworkedObject?) -> UIField,
}

declare extern type UIContainer extends UIField with
end

declare extern type UIGridLayout extends UIContainer with
	Spacing: number
	Columns: number
end

declare UIGridLayout: {
	New: (parent: NetworkedObject?) -> UIGridLayout,
}

declare extern type UIHVLayout extends UIContainer with
	Spacing: number
	ChildAlignment: UILayoutAlignment
end

declare extern type UIFlowLayout extends UIHVLayout with
end

declare extern type UIHFlow extends UIFlowLayout with
end

declare UIHFlow: {
	New: (parent: NetworkedObject?) -> UIHFlow,
}

declare extern type UIVFlow extends UIFlowLayout with
end

declare UIVFlow: {
	New: (parent: NetworkedObject?) -> UIVFlow,
}

declare extern type UIHLayout extends UIHVLayout with
end

declare UIHLayout: {
	New: (parent: NetworkedObject?) -> UIHLayout,
}

declare extern type UIVLayout extends UIHVLayout with
end

declare UIVLayout: {
	New: (parent: NetworkedObject?) -> UIVLayout,
}

declare extern type UIScrollView extends UIContainer with
	HorizontalScrollMode: UIScrollMode
	VerticalScrollMode: UIScrollMode
end

declare UIScrollView: {
	New: (parent: NetworkedObject?) -> UIScrollView,
}

declare extern type UIImage extends UIField with
	Image: ImageAsset
	--- @deprecated -- Obsolete, use 'Image' instead
	ImageID: string
	--- @deprecated -- Obsolete, use 'Image' instead
	ImageType: ImageType
	TextureScale: Vector2
	TextureOffset: Vector2
	Color: Color
	StretchMode: ImageStretchMode
	TextureFilter: TextureFilter
	FlipHorizontal: boolean
	FlipVertical: boolean
	read Loading: boolean
end

declare UIImage: {
	New: (parent: NetworkedObject?) -> UIImage,
}

declare extern type UIView extends UIField with
	BorderColor: Color
	Color: Color
	BorderMode: BorderMode
	BorderWidth: number
	CornerRadius: number
end

declare UIView: {
	New: (parent: NetworkedObject?) -> UIView,
}

declare extern type UILabel extends UIView with
	Text: string
	TextColor: Color
	OutlineWidth: number
	OutlineColor: Color
	HorizontalAlignment: HorizontalAlignment
	VerticalAlignment: VerticalAlignment
	FontSize: number
	AutoSize: boolean
	MaxAutoSize: number
	UseRichText: boolean
	FontAsset: FontAsset
	--- @deprecated -- Obsolete, use 'FontAsset' instead
	Font: FontPreset
	TextTrimming: TextTrimming
	TextWrapped: boolean
end

declare UILabel: {
	New: (parent: NetworkedObject?) -> UILabel,
}

declare extern type UIButton extends UILabel with
	read Clicked: PTSignal
end

declare UIButton: {
	New: (parent: NetworkedObject?) -> UIButton,
}

declare extern type UITextInput extends UIView with
	Text: string
	TextColor: Color
	JustifyText: HorizontalAlignment
	FontSize: number
	AutoSize: boolean
	MaxAutoSize: number
	MultiLine: boolean
	Placeholder: string
	PlaceholderColor: Color
	ReadOnlyColor: Color
	ReadOnly: boolean
	FontAsset: FontAsset
	--- @deprecated -- Obsolete, use 'FontAsset' instead
	Font: FontPreset
	read Submitted: PTSignal<string>
	read Changed: PTSignal<string>
	read FocusEnter: PTSignal
	read FocusExit: PTSignal
	function Focus(self)
end

declare UITextInput: {
	New: (parent: NetworkedObject?) -> UITextInput,
}

declare extern type UIViewport extends UIField with
end

declare UIViewport: {
	New: (parent: NetworkedObject?) -> UIViewport,
}

declare extern type UIShadow extends Instance with
	Layers: { ShadowLayer }
end

declare UIShadow: {
	New: (parent: NetworkedObject?) -> UIShadow,
}

declare extern type UIStroke extends Instance with
	Thickness: UIScale
	Color: Color
end

declare UIStroke: {
	New: (parent: NetworkedObject?) -> UIStroke,
}

declare extern type ValueBase extends Instance with
	read Changed: PTSignal
end

declare extern type BoolValue extends ValueBase with
	Value: boolean
end

declare BoolValue: {
	New: (parent: NetworkedObject?) -> BoolValue,
}

declare extern type ColorValue extends ValueBase with
	Value: Color
end

declare ColorValue: {
	New: (parent: NetworkedObject?) -> ColorValue,
}

declare extern type InstanceValue extends ValueBase with
	Value: Instance
end

declare InstanceValue: {
	New: (parent: NetworkedObject?) -> InstanceValue,
}

declare extern type IntValue extends ValueBase with
	Value: number
end

declare IntValue: {
	New: (parent: NetworkedObject?) -> IntValue,
}

declare extern type NumberValue extends ValueBase with
	Value: number
end

declare NumberValue: {
	New: (parent: NetworkedObject?) -> NumberValue,
}

declare extern type QuaternionValue extends ValueBase with
	Value: Quaternion
end

declare QuaternionValue: {
	New: (parent: NetworkedObject?) -> QuaternionValue,
}

declare extern type RangeValue extends ValueBase with
	Value: NumberRange
end

declare RangeValue: {
	New: (parent: NetworkedObject?) -> RangeValue,
}

declare extern type StringValue extends ValueBase with
	Value: string
end

declare StringValue: {
	New: (parent: NetworkedObject?) -> StringValue,
}

declare extern type VariantValue extends ValueBase with
	Value: Variant
end

declare VariantValue: {
	New: (parent: NetworkedObject?) -> VariantValue,
}

declare extern type Vector2Value extends ValueBase with
	Value: Vector2
end

declare Vector2Value: {
	New: (parent: NetworkedObject?) -> Vector2Value,
}

declare extern type Vector3Value extends ValueBase with
	Value: Vector3
end

declare Vector3Value: {
	New: (parent: NetworkedObject?) -> Vector3Value,
}

declare extern type Weld extends Instance with
	Part0: Instance
	Part1: Instance
	Enabled: boolean
	function Break(self)
end

declare Weld: {
	New: (parent: NetworkedObject?) -> Weld,
}

declare extern type World extends Instance with
	read IsLocalTest: boolean
	read IsLegacyWorld: boolean
	read WorldID: number
	read ServerID: number
	read UpTime: number
	read ServerTime: number
	--- @deprecated -- Obsolete, use 'Players.PlayersCount' instead
	read PlayersConnected: number
	read InstanceCount: number
	--- @deprecated -- Obsolete, use 'InstanceCount' instead
	read LocalInstanceCount: number
	read Rendered: PTSignal<number>
	function GetNetworkedObject(self, networkID: string): NetworkedObject
	function GetFPS(self): number
end

declare extern type AchievementsService extends Instance with
	UseAchievementSound: boolean
	NotifyAchievements: boolean
	read GotAchievement: PTSignal<number>
	function AwardAsync(self, userID: number, achievementID: number)
	function HasAchievementAsync(self, userID: number, achievementID: number): boolean
end

declare extern type AssetsService extends Instance with
	@[deprecated { reason = "Use the class's corresponding .New static instead" }]
	function NewAsset(self, assetClassName: string): BaseAsset
	@[deprecated { use = "PTImageAsset.New" }]
	function NewPTImage(self, imgID: number): PTImageAsset
	@[deprecated { use = "PTAudioAsset.New" }]
	function NewPTAudio(self, audioID: number): PTAudioAsset
	@[deprecated { use = "PTMeshAsset.New" }]
	function NewPTMesh(self, assetID: number): PTMeshAsset
	function GetFileLinkByPath(self, path: string): FileLinkAsset
	function GetFileLinkByID(self, id: string): FileLinkAsset
end

declare extern type CaptureService extends Instance with
	read OnCooldown: boolean
	CanCapture: boolean
	DefaultCaptureOverlay: UIField
	SpectatorAttach: Dynamic
	function TakePhotoAtDynamic(self, dyn: Dynamic, photoSize: Vector2?, overlay: UIField?)
	function TakePhotoAt(self, pos: Vector3, rot: Vector3, photoSize: Vector2?, overlay: UIField?)
end

declare extern type ChatService extends Instance with
	ChatPredicate: (...any) -> ...any
	read NewChatMessage: PTSignal<Player, string>
	read MessageReceived: PTSignal<string>
	read MessageDeclined: PTSignal
	function BroadcastMessage(self, msg: string)
	function UnicastMessage(self, msg: string, plr: Player)
end

declare extern type CoreUIService extends Instance with
	CtrlLockCursor: CtrlLockCursor
	ChatBubbleRenderDistance: number
	UseUserCard: boolean
	UseChat: boolean
	UseHealthBar: boolean
	UseLeaderboard: boolean
	UseHotbar: boolean
	UseBackpack: boolean
	UseMenuButton: boolean
	UseEmoteWheel: boolean
	CanRespawn: boolean
end

declare CoreUIService: {
	--- @readonly
	TopInset: number,
}

declare extern type DatastoreService extends Instance with
	function GetDatastore(self, key: string): Datastore
end

declare extern type FilterService extends Instance with
end

declare FilterService: {
	Filter: (input: string) -> string,
}

declare extern type HookService extends Instance with
	read Updated: PTSignal<number>
	read PreRendered: PTSignal<number>
	read PostRendered: PTSignal<number>
	read PhysicsUpdated: PTSignal<number>
end

declare extern type HttpService extends Instance with
	function RequestAsync(self, data: HttpRequestData): HttpResponseData
	function GetAsync(self, url: string, headers: { [string]: string }?): string
	function PostAsync(self, url: string, body: string, headers: { [string]: string }?): string
	function PutAsync(self, url: string, body: string, headers: { [string]: string }?): string
	function DeleteAsync(self, url: string, body: string, headers: { [string]: string }?): string
	function PatchAsync(self, url: string, body: string, headers: { [string]: string }?): string
	function GetBufferAsync(self, url: string, headers: { [string]: string }?): buffer
	function PostBufferAsync(self, url: string, body: string, headers: { [string]: string }?): buffer
	function PutBufferAsync(self, url: string, body: string, headers: { [string]: string }?): buffer
	function DeleteBufferAsync(self, url: string, body: string, headers: { [string]: string }?): buffer
	function PatchBufferAsync(self, url: string, body: string, headers: { [string]: string }?): buffer
	@[deprecated { use = "GetAsync" }]
	function Get(self, url: string, callback: (...any) -> ()?, headers: { [string]: string }?)
	@[deprecated { use = "PostAsync" }]
	function Post(self, url: string, body: string, callback: (...any) -> ()?, headers: { [string]: string }?)
	@[deprecated { use = "PutAsync" }]
	function Put(self, url: string, body: string, callback: (...any) -> ()?, headers: { [string]: string }?)
	@[deprecated { use = "DeleteAsync" }]
	function Delete(self, url: string, body: string, callback: (...any) -> ()?, headers: { [string]: string }?)
	@[deprecated { use = "PatchAsync" }]
	function Patch(self, url: string, body: string, callback: (...any) -> ()?, headers: { [string]: string }?)
end

declare extern type InputService extends Instance with
	read IsWindowFocused: boolean
	read IsTouchscreen: boolean
	read IsGameFocused: boolean
	read IsInputFocused: boolean
	read IsGamepadConnected: boolean
	read IsMenuOpened: boolean
	CursorLocked: boolean
	CursorVisible: boolean
	read MouseDelta: Vector2
	read MousePosition: Vector2
	read ScreenWidth: number
	read ScreenHeight: number
	read MouseMoved: PTSignal<Vector2>
	read GameFocused: PTSignal
	read GameUnfocused: PTSignal
	read GamepadConnected: PTSignal
	read GamepadDisconnected: PTSignal
	read KeyDown: PTSignal<KeyCode, boolean>
	read KeyUp: PTSignal<KeyCode, boolean>
	read AxisValueChanged: PTSignal<KeyCode, number>
	function StartGamepadVibration(self, weakMagnitude: number, strongMagnitude: number, duration: number)
	function StopGamepadVibration(self)
	function GetMouseWorldPosition(self, ignoreList: { Instance }?): Vector3
	function GetVector2(self, actionName: string): InputActionVector2
	function GetButton(self, actionName: string): InputActionButton
	function GetAxis(self, actionName: string): InputActionAxis
	function BindButton(self, name: string): InputActionButton
	function BindAxis(self, name: string): InputActionAxis
	function BindVector2(self, name: string): InputActionVector2
end

declare extern type InsertService extends Instance with
	@[deprecated { use = "ModelAsync" }]
	function Model(self, id: number, callback: (...any) -> ()?)
	function DefaultNPC(self): NPC
	function InitializeDefaultNPC(self, npc: NPC)
	function DefaultCharacter(self): PolytorianModel
	function ModelAsync(self, id: number): Instance
	function ClothingAsync(self, id: number): Clothing
	function AccessoryAsync(self, id: number): Accessory
	function ToolAsync(self, id: number): Tool
end

declare extern type IOService extends Instance with
	function ReadBytesFromPath(self, path: string): buffer
	function ReadTextFromPath(self, path: string): string
	function WriteBytesToPath(self, path: string, bytes: buffer)
	function WriteTextToPath(self, path: string, txt: string)
	function ListProjectFiles(self): { string }
	function ReadBytesFromID(self, id: string): buffer
	function GetPathFromID(self, indexID: string): string
end

declare extern type PreferencesService extends Instance with
	read CameraSensitivity: number
	read UiScale: number
	read SettingChanged: PTSignal<string, any>
	function Get(self, name: string): any
end

declare extern type PresenceService extends Instance with
	State: string
	CoverImage: PTImageAsset
	function ResetTimer(self)
end

declare extern type PurchasesService extends Instance with
	function PromptAsync(self, player: Player, assetID: number): boolean
	function OwnsItemAsync(self, player: Player, assetID: number): boolean
end

declare extern type ScriptService extends Instance with
end

declare extern type SocialService extends Instance with
end

declare extern type TweenService extends Instance with
	function NewTween(self): TweenObject
end

declare extern type WorldsService extends Instance with
	function NewServerAsync(self, worldPath: string): string
	function NewServerAsync(self, data: NewServerRequestData): string
	function JoinWorldAsync(self, plr: Player, to: string)
	function JoinWorldPartyAsync(self, plrs: { Player }, to: string)
	function JoinPrivateAsync(self, plr: Player, accessID: string)
	function JoinPrivatePartyAsync(self, players: { Player }, accessID: string)
end

declare extern type CreatorAddons extends Instance with
	function Register(self, identifier: string): AddonObject
end

declare extern type CreatorContextService extends Instance with
end

declare extern type CreatorGUI extends Instance with
end

declare extern type CreatorHistory extends Instance with
	function NewAction(self, title: string)
	function AddDoCallback(self, callback: (...any) -> ())
	function AddUndoCallback(self, callback: (...any) -> ())
	function CommitAction(self)
end

declare extern type CreatorSelections extends Instance with
	read Selected: PTSignal<Instance>
	read Deselected: PTSignal<Instance>
	function Select(self, instance: Instance)
	function SelectChild(self, instance: Instance)
	function GetSelected(self): { Instance }
	function Deselect(self, instance: Instance)
	function SelectOnly(self, instance: Instance)
	function DeselectAll(self)
	function HasSelected(self, instance: Instance): boolean
end

declare extern type BaseAsset extends NetworkedObject with
end

declare extern type FileLinkAsset extends BaseAsset with
	LinkedID: string
end

declare FileLinkAsset: {
	New: (parent: NetworkedObject?) -> FileLinkAsset,
}

declare extern type ResourceAsset extends BaseAsset with
	read Loading: boolean
	read Loaded: PTSignal
end

declare extern type AudioAsset extends ResourceAsset with
end

declare extern type BuiltInAudioAsset extends AudioAsset with
	AudioPreset: BuiltInAudioPreset
end

declare BuiltInAudioAsset: {
	New: (parent: NetworkedObject?) -> BuiltInAudioAsset,
}

declare extern type PTAudioAsset extends AudioAsset with
	AudioID: number
end

declare PTAudioAsset: {
	New: (parent: NetworkedObject?) -> PTAudioAsset,
}

declare extern type FontAsset extends ResourceAsset with
end

declare extern type BuiltInFontAsset extends FontAsset with
	FontPreset: FontPreset
	FontWeight: FontWeight
	FontStyle: FontStyle
end

declare BuiltInFontAsset: {
	New: (parent: NetworkedObject?) -> BuiltInFontAsset,
}

declare extern type ImageAsset extends ResourceAsset with
end

declare extern type GradientImageAsset extends ImageAsset with
	Series: ColorSeries
	Width: number
	Height: number
	Fill: GradientImageFill
	FillFrom: Vector2
	FillTo: Vector2
end

declare GradientImageAsset: {
	New: (parent: NetworkedObject?) -> GradientImageAsset,
}

declare extern type PTImageAsset extends ImageAsset with
	ImageID: number
	ImageType: ImageType
end

declare PTImageAsset: {
	New: (parent: NetworkedObject?) -> PTImageAsset,
}

declare extern type MeshAnimationAsset extends ResourceAsset with
	AnimationType: MeshAnimationType
end

declare extern type PTMeshAnimationAsset extends MeshAnimationAsset with
	AssetID: number
end

declare PTMeshAnimationAsset: {
	New: (parent: NetworkedObject?) -> PTMeshAnimationAsset,
}

declare extern type MeshAsset extends ResourceAsset with
end

declare extern type PTMeshAsset extends MeshAsset with
	AssetID: number
end

declare PTMeshAsset: {
	New: (parent: NetworkedObject?) -> PTMeshAsset,
}

declare extern type ColorSeries with
	read PointCount: number
	function Clear(self)
	function SetColor(self, point: number, color: Color)
	function RemovePoint(self, point: number)
	function GetOffsets(self): { number }
	function GetColors(self): { Color }
	function SetOffset(self, point: number, offset: number)
	function GetColor(self, point: number): Color
	function GetOffset(self, point: number): number
	function AddPoint(self, offset: number, color: Color): number
	function Lerp(self, t: number): Color
end

declare ColorSeries: {
	New: (() -> ColorSeries) & ((min: Color, max: Color) -> ColorSeries),
}

declare extern type Datastore with
	read Key: string
	function GetAsync(self, key: string): any
	function SetAsync(self, key: string, value: any)
	function RemoveAsync(self, key: string)
	function Disconnect(self)
end

declare extern type HttpRequestData with
	URL: string
	Method: HttpRequestMethod
	Body: string
	Headers: { [string]: string }
end

declare HttpRequestData: {
	New: () -> HttpRequestData,
}

declare extern type HttpResponseData with
	read Success: boolean
	read StatusCode: number
	read Headers: { [string]: string }
	read Body: string
	read Buffer: buffer
end

declare extern type InputButtonCollection with
	function AddButton(self, btn: InputButton)
	function RemoveButton(self, btn: InputButton)
	function GetButtons(self): { InputButton }
end

declare extern type InputAction with
end

declare extern type InputActionVector2 extends InputAction with
	Up: InputButtonCollection
	Down: InputButtonCollection
	Left: InputButtonCollection
	Right: InputButtonCollection
	read Value: Vector2
end

declare extern type InputActionButton extends InputAction with
	Buttons: InputButtonCollection
	IsPressed: boolean
	Weight: number
	read Pressed: PTSignal
	read Released: PTSignal
end

declare extern type InputActionAxis extends InputAction with
	Negative: InputButtonCollection
	Positive: InputButtonCollection
	read Value: number
end

declare extern type InputButton with
	KeyCode: KeyCode
	function __eq(self, b: InputButton): boolean
end

declare InputButton: {
	New: (() -> InputButton) & ((key: KeyCode) -> InputButton),
}

declare extern type NetMessage with
	function AddString(self, key: string, value: string)
	function AddInt(self, key: string, value: number)
	function AddBool(self, key: string, value: boolean)
	function AddNumber(self, key: string, value: number)
	function AddVector2(self, key: string, value: Vector2)
	function AddVector3(self, key: string, value: Vector3)
	function AddColor(self, key: string, value: Color)
	function AddQuaternion(self, key: string, value: Quaternion)
	function AddVariant(self, key: string, value: Variant)
	function AddInstance(self, key: string, value: Instance)
	function AddBuffer(self, key: string, buffer: buffer)
	function GetString(self, key: string): string
	function GetInt(self, key: string): number?
	function GetNumber(self, key: string): number?
	function GetBool(self, key: string): boolean?
	function GetVector2(self, key: string): Vector2?
	function GetVector3(self, key: string): Vector3?
	function GetColor(self, key: string): Color?
	function GetQuaternion(self, key: string): Quaternion?
	function GetVariant(self, key: string): Variant?
	function GetInstance(self, key: string): Instance
	function GetBuffer(self, key: string): buffer
end

declare NetMessage: {
	New: () -> NetMessage,
}

declare extern type NewServerRequestData with
	WorldPath: string
	MaxPlayers: number
end

declare NewServerRequestData: {
	New: () -> NewServerRequestData,
}

declare extern type NumberRange with
	Min: number
	Max: number
	function Lerp(self, t: number): number
end

declare NumberRange: {
	New: (from: number, to: number) -> NumberRange,
}

declare extern type NumberSeries with
	read PointCount: number
	function Clear(self)
	function SetValue(self, point: number, value: number)
	function RemovePoint(self, point: number)
	function GetOffsets(self): { number }
	function GetValues(self): { number }
	function SetOffset(self, point: number, offset: number)
	function GetValue(self, point: number): number
	function GetOffset(self, point: number): number
	function AddPoint(self, offset: number, value: number): number
	function Lerp(self, t: number): number
end

declare NumberSeries: {
	New: (() -> NumberSeries) & ((min: number, max: number) -> NumberSeries),
}

declare extern type ShadowLayer with
	Color: Color
	Offset: Vector2
	Radius: number
	Spread: number
	BlendMode: BlendMode
end

declare ShadowLayer: {
	New: () -> ShadowLayer,
}

declare extern type UIScale with
	Offset: number
	Scale: number
	function Compute(self, parentSize: number): number
end

declare extern type CreatorService with
	read LocalTestActive: boolean
	read LocalTestStarted: PTSignal
	read LocalTestStopped: PTSignal
end

declare CreatorService: {
	--- @readonly
	Interface: CreatorInterface,
	--- @readonly
	CurrentGame: World,
}

declare extern type CreatorInterface with
	read ToolMode: CreatorToolMode
	read TargetPartColor: Color
	read TargetPartMaterial: PartMaterial
	read MoveSnapEnabled: boolean
	read MoveSnapping: number
	read UserMoveSnapping: number
	read RotateSnapEnabled: boolean
	read RotateSnapping: number
	read UserRotateSnapping: number
end

declare extern type RayResult with
	Origin: Vector3
	Direction: Vector3
	Position: Vector3
	Normal: Vector3
	Distance: number
	Instance: Instance
end

declare extern type MeshAnimationInfo with
	Name: string
	Length: number
	IsPlaying: boolean
end

declare extern type TweenObject with
	Looped: boolean
	Parallel: boolean
	SpeedScale: number
	Direction: TweenDirection
	Transition: TweenTransition
	read IsRunning: boolean
	read ElapsedTime: number
	read Finished: PTSignal
	read Canceled: PTSignal
	function SetDirection(self, dir: TweenDirection): TweenObject
	function SetTrans(self, trans: TweenTransition): TweenObject
	function TweenPosition(self, target: Dynamic, destination: Vector3, time: number)
	function TweenRotation(self, target: Dynamic, destination: Vector3, time: number)
	function TweenSize(self, target: Dynamic, destination: Vector3, time: number)
	function TweenColor(self, from: Color, to: Color, time: number, callback: (...any) -> ())
	function TweenNumber(self, from: number, to: number, time: number, callback: (...any) -> ())
	function TweenVector2(self, from: Vector2, to: Vector2, time: number, callback: (...any) -> ())
	function TweenVector3(self, from: Vector3, to: Vector3, time: number, callback: (...any) -> ())
	function TweenQuaternion(self, from: Quaternion, to: Quaternion, time: number, callback: (...any) -> ())
	function Play(self)
	function Pause(self)
	function Stop(self)
	function Interval(self, sec: number)
	function Chain(self): TweenObject
	function Cancel(self, callFinished: boolean?)
end

declare extern type AddonObject with
	read Identifier: string
	AddonName: string
	AddonIcon: PTImageAsset
	read CleanupReceived: PTSignal
	function CreateToolItem(self, txt: string): AddonToolItem
end

declare AddonObject: {
	RequestPermissions: (perms: { AddonPermission }) -> (),
}

declare extern type AddonToolItem with
	read Pressed: PTSignal
end
