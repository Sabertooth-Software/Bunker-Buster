extends Node2D

@onready var total_score = 0
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
	
func get_current_score() -> int:
	var current_scene = get_tree().get_current_scene().scene_file_path
	return scores[current_scene]
	
func get_total_score() -> int:
	var total_score: int = 0
	for value in scores:
		total_score += scores[value]
	return total_score
