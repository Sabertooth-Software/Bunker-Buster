extends Node2D
class_name ShootingComponent

func shoot(direction: Vector2, bullet: PackedScene, initiator: Node2D):
	var projectile: Bullet = bullet.instantiate()
	var current_scene: Node = get_tree().get_current_scene()

	projectile.setup(global_position, direction, current_scene, initiator)
