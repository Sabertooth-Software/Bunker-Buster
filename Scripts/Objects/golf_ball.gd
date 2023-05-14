extends RigidBody2D
class_name GolfBall

@onready var terrain_detector: TerrainDetector = $TerrainDetector
@onready var arrow: Node2D = $Arrow
@onready var stroke_audio: AudioStreamPlayer = $strokeAudio

@export var terrain_map: Dictionary

@export var max_shot_power: float = 100
@export var speed_modifier: float = 500


var _start_position: Vector2
var _shoot_vector: Vector2
var _deccel: float
var _proportion: float
var _putting: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	terrain_detector.terrain_changed.connect(_on_terrain_chnaged)
	GameModeManager.change_mode.connect(_on_change_mode)
	visible = GameModeManager.get_current_mode() == GameModeManager.Mode.GOLF
	_deccel = terrain_map[Terrain.Type.GRASS]

func _process(_delta):
	if GameModeManager.get_current_mode() == GameModeManager.Mode.GOLF and linear_velocity.length() < 30:
		if Input.is_action_just_pressed("putt"):
			_putting = true
			arrow.visible = true
			_start_position = get_global_mouse_position()
		if Input.is_action_pressed("putt") and _putting:
			_shoot_vector = _start_position - get_global_mouse_position()
			_proportion = clampf(_shoot_vector.length()/max_shot_power, 0, 1)
			arrow.scale.y = _proportion * .75
			arrow.global_rotation = _shoot_vector.normalized().angle() + (PI/2)
		if Input.is_action_just_released("putt") and _putting:
			arrow.visible = false
			_shoot_vector = _shoot_vector.normalized() * speed_modifier * _proportion
			apply_central_impulse(_shoot_vector)
			arrow.scale.y = 0
			ShotCounter.shoot.emit()
			stroke_audio.play(0.08)
			_putting = false
		
func _physics_process(_delta):
	var slow_vector: Vector2 = lerp(linear_velocity, Vector2.ZERO, _deccel) * -1
	apply_central_impulse(slow_vector)
	if terrain_detector.is_on_water:
		linear_velocity = Vector2.ZERO
		global_position = _start_position


func _on_terrain_chnaged(new_terrain: Terrain.Type):
	_deccel = terrain_map[new_terrain]
	
func _on_change_mode(new_mode: GameModeManager.Mode):
	visible = GameModeManager.get_current_mode() == GameModeManager.Mode.GOLF

