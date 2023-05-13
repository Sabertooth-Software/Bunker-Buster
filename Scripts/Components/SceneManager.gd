extends Node

signal scene_changed()

func change_scene(name: String):
	get_tree().change_scene_to_file("res://Scenes/Levels/"+name+".tscn")
	print("Changing Scene to "+name)

