extends RigidBody2D

var _start_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("putt"):
		_start_position = get_global_mouse_position()
	if Input.is_action_just_released("putt"):
		var shoot_vector: Vector2 = _start_position - get_global_mouse_position()
		shoot_vector = shoot_vector.normalized() * 1000
		apply_central_impulse(shoot_vector)

