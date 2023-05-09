extends RigidBody2D
class_name Bullet  

var velocity: Vector2  

func _physics_process(_delta):     
	apply_central_force(velocity * 1000)
   
func setup(_position: Vector2, _velocity: Vector2, _scene: Node, _initiator: Node2D):     
	_scene.add_child(self)
	add_collision_exception_with(_initiator)
	global_position = _position     
	velocity = _velocity

