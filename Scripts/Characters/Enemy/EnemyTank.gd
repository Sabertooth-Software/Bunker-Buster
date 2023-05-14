extends Tank

@export var bullet: PackedScene
@export var target: Node2D
@export var timeout: float = 1.5
@export var points: Array

@onready var timer: Timer = $Timer

var point_index: int = 0
var next_point: Vector2
var move_vector: Vector2

func _ready():
	super._ready()
	add_to_group(ShotCounter.tank_group)
	if target == null:
		var player_tank: Node = get_tree().get_current_scene().get_node("PlayerTank")
		if player_tank is PlayerTank:
			target = player_tank
			_setup_timer()
	if points:
		next_point = points[0]

func _get_next_point():
	if point_index >= points.size() - 1:
		point_index = 0
	else :
		point_index += 1
	next_point = points[point_index]

func _handle_movement():
	if next_point==null:
		_get_next_point()
	var dist = global_position.distance_to(next_point)/100
	if dist> .2:
		move_vector = (next_point-global_position).normalized()
		super.move(move_vector*5)
	else:
		_get_next_point()

func _on_hit(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int):
	super._on_hit(body_rid, body, body_shape_index, local_shape_index)
	if body is Bullet and self not in body.get_collision_exceptions():
		remove_from_group(ShotCounter.tank_group)
		ShotCounter.tank_destroyed.emit()

func on_timeout():
	assert(target != null, "Tried to shoot without target assigned to enemy tank")
	var shooting_vector: Vector2 = target.global_position - global_position
	assert(bullet != null, "Tried to shoot without Bullet assigned to enemy tank")
	super.shoot(shooting_vector, bullet)

func _process(_delta):
	super.look(target.global_position)
	if points:
		_handle_movement()

func _setup_timer():
	timer.timeout.connect(on_timeout)
	timer.wait_time = timeout
	timer.start()
