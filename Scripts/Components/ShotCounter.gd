extends Node2D

var scores:Dictionary

signal shoot()
signal score_update(score: int)
signal tank_destroyed()

var tank_group: String = "Tanks"

func _ready():
	shoot.connect(_on_shoot)
	tank_destroyed.connect(_on_tank_destroy)
	
func _on_shoot():
	var current_scene = get_tree().get_current_scene().scene_file_path
	if scores.get(current_scene) != null:
		scores[current_scene] += 1
	else:
		scores[current_scene] = 1
	score_update.emit(scores[current_scene])
	
func _on_tank_destroy():
	var groups: Array = get_tree().get_nodes_in_group(tank_group)
	print(groups)
	if groups.size() <= 1:
		GameModeManager.change_mode.emit(GameModeManager.Mode.GOLF)
	
func get_current_score() -> int:
	var current_scene = get_tree().get_current_scene().scene_file_path
	return scores[current_scene]
	
func get_total_score() -> int:
	var total_score: int = 0
	var total_par: int = 0
	for value in scores:
		total_score += scores[value]
	for element in scores:
		total_par += SceneManager.level_data[element].par
	print(total_par)
	return (total_score-total_par)
	
