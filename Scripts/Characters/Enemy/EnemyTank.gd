extends Tank

@export var bullet: PackedScene
@export var target: Node2D
@export var timeout: float = 1.5
@export var points: Array[Vector2]

@onready var timer: Timer = $Timer
@onready var tank_explosion: AudioStreamPlayer = $tankDestroyed
@onready var smoke: CPUParticles2D = $Smoke

var point_index: int = 0
var next_point: Vector2
var move_vector: Vector2
var rng = RandomNumberGenerator.new()

var _destroyed: bool = false

func _ready():
	super._ready()
	
	
	add_to_group(ShotCounter.tank_group)
	if target == null:
		var player_tank: Node = get_tree().get_current_scene().get_node("PlayerTank")
		if player_tank and player_tank is PlayerTank:
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

func _on_hit(body_rid: RID, _body: Node2D, body_shape_index: int, local_shape_index: int):
	super._on_hit(body_rid, _body, body_shape_index, local_shape_index)
	if _body is Bullet and self not in _body.get_collision_exceptions():
		remove_from_group(ShotCounter.tank_group)
		ShotCounter.tank_destroyed.emit()
		tank_explosion.play()
		# jank as hell
		timer.stop()
		points = []
		_destroyed = true

func on_timeout():
	var my_random_number = rng.randf_range(1.5, 2.5)
	timer.wait_time = my_random_number
	assert(target != null, "Tried to shoot without target assigned to enemy tank")
	var shooting_vector: Vector2 = target.global_position - global_position
	assert(bullet != null, "Tried to shoot without Bullet assigned to enemy tank")
	super.shoot(shooting_vector, bullet)

func _process(_delta):
	super.look(target.global_position)
	if points:
		_handle_movement()
	if _destroyed:
		smoke.emitting = true

func _setup_timer():
	timer.timeout.connect(on_timeout)
	var my_random_number = rng.randf_range(1.5, 2.5)
	timer.wait_time = my_random_number
	timer.start()
