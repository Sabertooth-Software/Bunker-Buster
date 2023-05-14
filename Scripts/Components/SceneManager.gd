extends Node

var level_data: Dictionary
var current_level: LevelData 
var title_screen: String = "res://Scenes/Levels/Title Screen.tscn" 

signal scene_changed()
signal level_complete()

func _ready():
	level_data = {
		"res://Scenes/Levels/Hole 1.tscn": LevelData.new(1, 3),
		"res://Scenes/Levels/Hole 2.tscn": LevelData.new(2, 5),
		"res://Scenes/Levels/Hole 3.tscn": LevelData.new(3, 8),
		"res://Scenes/Levels/Hole 4.tscn": LevelData.new(4, 6),
		"res://Scenes/Levels/Hole 5.tscn": LevelData.new(5, 6),
		"res://Scenes/Levels/Hole 6.tscn": LevelData.new(6, 6),
		"res://Scenes/Levels/Hole 7.tscn": LevelData.new(7, 5),
		"res://Scenes/Levels/Hole 8.tscn": LevelData.new(8, 10),
		"res://Scenes/Levels/Hole 9.tscn": LevelData.new(9, 11)
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
	if level_number>9:
		return_to_title()
	else:
		var new_level: String = "res://Scenes/Levels/Hole " + str(level_number) + ".tscn"
		current_level = level_data[new_level]
		get_tree().change_scene_to_file(new_level)
	
func get_level_data() -> LevelData:
	var current_scene = get_tree().get_current_scene().scene_file_path
	return level_data.get(current_scene)
	
func return_to_title():
	get_tree().change_scene_to_file(title_screen)

