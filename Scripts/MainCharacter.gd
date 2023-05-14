extends Tank
class_name PlayerTank

@export var bullet: PackedScene

func _ready():
	super._ready()

func _process(_delta):
	if GameModeManager.get_current_mode() == GameModeManager.Mode.TANKS:
		if Input.is_action_just_pressed("shoot"):
			var shooting_vector: Vector2 = get_global_mouse_position() - global_position
			super.shoot(shooting_vector, bullet)
			ShotCounter.shoot.emit()
		if Input.is_action_just_pressed("debug_finishlevel"):
			ShotCounter.finish_level()
		

func _physics_process(_delta):
	if GameModeManager.get_current_mode() == GameModeManager.Mode.TANKS:
		super.look(get_global_mouse_position())
		var moving_vector: Vector2 = Input.get_vector("left", "right", "up", "down")
		if moving_vector:
			super.move(moving_vector)
			
