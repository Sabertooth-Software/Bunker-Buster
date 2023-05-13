extends RigidBody2D

@onready var terrain_detector: TerrainDetector = $TerrainDetector
@onready var arrow: Node2D = $Arrow

var _start_position: Vector2
var _shoot_vector: Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	terrain_detector.terrain_changed.connect(_on_terrain_chnaged)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("putt"):
		_start_position = get_global_mouse_position()
	if Input.is_action_pressed("putt"):
		_shoot_vector = _start_position - get_global_mouse_position()
		#print((_start_position - get_global_mouse_position()).normalized())
		arrow.scale.y = 1
		arrow.rotation = _shoot_vector.normalized().angle() + (PI/2)
	if Input.is_action_just_released("putt"):
		_shoot_vector = _shoot_vector.normalized() * 100
		apply_central_impulse(_shoot_vector)
		arrow.scale.y = 0
		ShotCounter.increase_shots()


func _on_terrain_chnaged(new_terrain: Terrain.Type):
	print(new_terrain)
