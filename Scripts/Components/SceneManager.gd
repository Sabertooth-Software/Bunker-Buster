extends Node

var level_data: Dictionary
var current_level: LevelData

signal scene_changed()
signal level_complete()

func _ready():
	level_data = {
		"res://Scenes/Levels/Hole 1.tscn": LevelData.new(1, 1),
		"res://Scenes/Levels/Hole 2.tscn": LevelData.new(2, 2),
		"res://Scenes/Levels/Hole 3.tscn": LevelData.new(3, 3),
		"res://Scenes/Levels/Hole 4.tscn": LevelData.new(4, 4)
	}
	var current: String = get_tree().get_current_scene().scene_file_path
	if level_data.get(current) != null:
		current_level = level_data[current]

func next_level():
	_set_level(current_level.level_number + 1)

func select_level(level_number: int):
	_set_level(level_number)
	
func _set_level(level_number: int):
	GameModeManager.change_mode.emit(GameModeManager.Mode.TANKS)
	var new_level: String = "res://Scenes/Levels/Hole " + str(level_number) + ".tscn"
	current_level = level_data[new_level]
	get_tree().change_scene_to_file(new_level)
	
func get_level_data() -> LevelData:
	var current_scene = get_tree().get_current_scene().scene_file_path
	return level_data.get(current_scene)

