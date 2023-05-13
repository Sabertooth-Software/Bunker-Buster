extends Tank

@export var bullet: PackedScene
@export var target: Node2D
@export var timeout: float = 1.5

@onready var timer: Timer = $Timer

@onready var Pos0 : Node2D = $Position0
@onready var Pos1 : Node2D = $Position1

var wander_points = []
var point_index: int = 0
var next_point: Vector2
var move_vector: Vector2

func _get_next_point():
	if point_index+1==wander_points.size():
		point_index = 0
	else :
		point_index = point_index+1
	next_point = wander_points[point_index]

func _handle_movement():
	if next_point==null:
		_get_next_point()
	var dist = global_position.distance_to(next_point)/100
	if dist>.2:
		move_vector = (next_point-global_position).normalized()
		super.move(move_vector*5)
	else:
		_get_next_point()

func _ready():
	if target == null:
		var player_tank: Node = get_tree().get_current_scene().get_node("PlayerTank")
		if player_tank is PlayerTank:
			target = player_tank
			_setup_timer()
	wander_points.append(Pos0.global_position)
	wander_points.append(Pos1.global_position)
	next_point = wander_points[0]

func on_timeout():
	assert(target != null, "Tried to shoot without target assigned to enemy tank")
	var shooting_vector: Vector2 = target.global_position - global_position
	assert(bullet != null, "Tried to shoot without Bullet assigned to enemy tank")
	super.shoot(shooting_vector, bullet)

func _process(_delta):
	super.look(target.global_position)
	_handle_movement()

func _setup_timer():
	timer.timeout.connect(on_timeout)
	timer.wait_time = timeout
	timer.start()
