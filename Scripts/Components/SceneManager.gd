extends Node

var level_data: Dictionary

signal scene_changed()

func _ready():
	level_data = {
		"res://Scenes/Levels/Hole 1.tscn": LevelData.new(6),
		"res://Scenes/Levels/Hole 2.tscn": LevelData.new(6),
		"res://Scenes/Levels/Hole 3.tscn": LevelData.new(6),
		"res://Scenes/Levels/Hole 4.tscn": LevelData.new(6),
	}

func change_scene(name: String):
	get_tree().change_scene_to_file("res://Scenes/Levels/"+name+".tscn")
	print("Changing Scene to "+name)
	
func get_level_data() -> LevelData:
	var current_scene = get_tree().get_current_scene().scene_file_path
	return level_data.get(current_scene)

