extends RigidBody2D
class_name CBullet

var velocity: Vector2

func _physics_process(delta):
	apply_central_force(velocity * 1000)
	
func setup(_position: Vector2, _velocity: Vector2, _scene: Node):
	_scene.add_child(self)
	global_position = _position
	velocity = _velocity
	
