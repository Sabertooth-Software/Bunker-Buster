extends RigidBody2D

@onready var terrain_detector: TerrainDetector = $TerrainDetector

var _start_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	terrain_detector.terrain_changed.connect(_on_terrain_chnaged)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("putt"):
		_start_position = get_global_mouse_position()
	if Input.is_action_just_released("putt"):
		var shoot_vector: Vector2 = _start_position - get_global_mouse_position()
		shoot_vector = shoot_vector.normalized() * 100
		apply_central_impulse(shoot_vector)

func _on_terrain_chnaged(new_terrain: Terrain.Type):
	print(new_terrain)
