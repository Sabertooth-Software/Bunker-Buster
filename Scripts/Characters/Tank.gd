extends CharacterBody2D
class_name Tank

@export var Speed: float = 1000
@export var Bullet_Speed: float = 10.0

@onready var canon: Node2D = $Canon
@onready var body: Node2D = $Body
@onready var hitbox: Area2D = $Hitbox
@onready var tank_fire: AudioStreamPlayer = $tankFire

@onready var shooting_component: ShootingComponent = $Canon/ShootingComponent

func _ready():
	hitbox.body_shape_entered.connect(_on_hit)

func move(direction: Vector2):
	if direction:
		velocity = direction * Speed
		rotation = velocity.normalized().angle() + PI/2
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	
func shoot(direction: Vector2, bullet: PackedScene):
	var shooting_vector: Vector2 = direction.normalized() * Bullet_Speed
	shooting_component.shoot(shooting_vector, bullet, self)
	tank_fire.play()
	
func look(point: Vector2):
	canon.look_at(point)
	canon.rotate(PI/2)
	
func _on_hit(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int):
	if body is Bullet and self not in body.get_collision_exceptions():
		body.queue_free()
		print("ahh")

