extends Tank

@export var bullet: PackedScene
@export var target: Node2D
@export var timeout: float = 1.5

@onready var timer: Timer = $Timer

func _ready():
	if target == null:
		var player_tank: Node = get_tree().get_current_scene().get_node("PlayerTank")
		if player_tank is PlayerTank:
			target = player_tank
			_setup_timer()

func on_timeout():
	assert(target != null, "Tried to shoot without target assigned to enemy tank")
	var shooting_vector: Vector2 = target.global_position - global_position
	assert(bullet != null, "Tried to shoot without Bullet assigned to enemy tank")
	super.shoot(shooting_vector, bullet)

func _process(_delta):
	super.look(target.global_position)

func _setup_timer():
	timer.timeout.connect(on_timeout)
	timer.wait_time = timeout
	timer.start()
