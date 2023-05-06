extends Node2D
class_name ShootingComponent

@export var bullet: PackedScene

func shoot(direction: Vector2):
	var projectile: Bullet = bullet.instantiate()
	var current_scene: Node = get_tree().get_current_scene()
	projectile.setup(global_position, direction, current_scene)
