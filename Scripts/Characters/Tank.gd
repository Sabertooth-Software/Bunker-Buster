extends CharacterBody2D
class_name Tank

@export var Speed: float = 1000
@export var Bullet_Speed: float = 10.0

@onready var canon: Node2D = $Canon
@onready var body: Node2D = $Body
@onready var hitbox: Area2D = $Hitbox

@onready var shooting_component: ShootingComponent = $ShootingComponent

func _ready():
	hitbox.body_shape_entered.connect(_on_hit)

func move(direction: Vector2):
	if direction:
		velocity = direction * Speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	
func shoot(direction: Vector2, bullet: PackedScene):
	var shooting_vector: Vector2 = direction.normalized() * Bullet_Speed
	shooting_component.shoot(shooting_vector, bullet, self)
	
func look(point: Vector2):
	canon.look_at(point)
	
func _on_hit(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int):
	if body is Bullet and self not in body.get_collision_exceptions():
		print("ahh")

