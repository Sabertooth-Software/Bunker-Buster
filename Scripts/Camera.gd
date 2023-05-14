extends Camera2D

@export var target: Node2D
@export var panning_speed: float = 100

func _ready():
	if target == null:
		var player_tank: Node = get_tree().get_current_scene().get_node("PlayerTank")
		if player_tank and player_tank is PlayerTank:
			target = player_tank

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var current_mode: GameModeManager.Mode = GameModeManager.get_current_mode()
	if  current_mode == GameModeManager.Mode.TANKS:
		global_position = target.global_position
	elif current_mode == GameModeManager.Mode.GOLF:
		_handle_freecam(delta)

func _handle_freecam(delta: float):
	var movement_vector: Vector2 = Input.get_vector("left", "right", "up", "down")
	global_position += movement_vector * delta * panning_speed
	
