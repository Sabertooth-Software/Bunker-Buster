extends Tank
class_name PlayerTank

@export var bullet: PackedScene

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		var shooting_vector: Vector2 = get_global_mouse_position() - global_position
		super.shoot(shooting_vector, bullet)

func _physics_process(_delta):
	super.look(get_global_mouse_position())
	
	var moving_vector: Vector2 = Input.get_vector("left", "right", "up", "down")
	if moving_vector:
		super.move(moving_vector)
