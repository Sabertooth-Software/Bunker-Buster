extends Tank
class_name PlayerTank

@export var bullet: PackedScene

var _start_position: Vector2

func _ready():
	super._ready()
	add_to_group(ShotCounter.tank_group)
	_start_position = global_position

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
			

func _on_hit(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int):
	if body is Bullet and self not in body.get_collision_exceptions():
		global_position = _start_position
		ShotCounter.shoot.emit()
