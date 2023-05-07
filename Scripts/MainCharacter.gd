extends Node2D

@onready var tank: Tank = $Tank
@export var bullet: PackedScene

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		var shooting_vector: Vector2 = get_global_mouse_position() - global_position
		tank.shoot(shooting_vector, bullet)

func _physics_process(_delta):
	position = tank.position
	tank.look(get_global_mouse_position())
	
	var moving_vector: Vector2 = Input.get_vector("left", "right", "up", "down")
	if moving_vector:
		tank.move(moving_vector)
