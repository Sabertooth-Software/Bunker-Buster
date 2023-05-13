extends Node

var level_data: Dictionary

signal scene_changed()
signal end_scene()

var level_order = [
	"res://Scenes/Levels/Hole 1.tscn",
	"res://Scenes/Levels/Hole 2.tscn",
	"res://Scenes/Levels/Hole 3.tscn",
	"res://Scenes/Levels/Hole 4.tscn"
]

func _ready():
	level_data = {
		"res://Scenes/Levels/Hole 1.tscn": LevelData.new(1, 1),
		"res://Scenes/Levels/Hole 2.tscn": LevelData.new(2, 2),
		"res://Scenes/Levels/Hole 3.tscn": LevelData.new(3, 3),
		"res://Scenes/Levels/Hole 4.tscn": LevelData.new(4, 4)
	}

func next_level(current_level: int):
	get_tree().change_scene_to_file("res://Scenes/Levels/Hole " + str(current_level) + ".tscn")
	

func select_level(level_number: int):
	get_tree().change_scene_to_file("res://Scenes/Levels/Hole " + str(level_number - 1) + ".tscn")

	
func get_level_data() -> LevelData:
	var current_scene = get_tree().get_current_scene().scene_file_path
	return level_data.get(current_scene)

