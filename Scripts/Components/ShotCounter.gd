extends Node2D

@onready var total_score = 0
@onready var _par = 0

var scores:Dictionary

signal shoot()
signal score_update(score: int)

func _ready():
	shoot.connect(_on_shoot)
	
func _on_shoot():
	var current_scene = get_tree().get_current_scene().scene_file_path
	if scores.get(current_scene) != null:
		scores[current_scene] += 1
	else:
		scores[current_scene] = 1
	score_update.emit(scores[current_scene])
	
