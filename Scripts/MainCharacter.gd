extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var shooting_speed: float = 10.0

signal shoot(direction: Vector2)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		var direction: Vector2 = get_global_mouse_position() - global_position
		var shooting_vector: Vector2 = direction.normalized() * shooting_speed
		shoot.emit(shooting_vector)
		

func _physics_process(_delta):
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()
