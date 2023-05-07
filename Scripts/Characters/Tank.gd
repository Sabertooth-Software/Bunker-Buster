extends CharacterBody2D
class_name Tank

@export var Speed: float = 1000
@export var Bullet_Speed: float = 10.0

@onready var canon: Node2D = $Canon
@onready var body: Node2D = $Body

@onready var shooting_component: ShootingComponent = $ShootingComponent

func move(direction: Vector2):
	if direction:
		velocity = direction * Speed
		transform.x
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	
func shoot(direction: Vector2, bullet: PackedScene):
	var shooting_vector: Vector2 = direction.normalized() * Bullet_Speed
	shooting_component.shoot(shooting_vector, bullet)
	
func look(point: Vector2):
	canon.look_at(point)

