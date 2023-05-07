extends Node2D

@onready var tank: Tank = $Tank

@export var bullet: PackedScene
@export var target: Node2D


func shoot():
	assert(target != null, "Tried to shoot without target assigned to enemy tank")
	var shooting_vector: Vector2 = target.global_position - global_position
	assert(bullet != null, "Tried to shoot without Bullet assigned to enemy tank")
	tank.shoot(shooting_vector, bullet)

func _process(_delta):
	tank.look(target.global_position)

func _on_timer_timeout():
	shoot()
