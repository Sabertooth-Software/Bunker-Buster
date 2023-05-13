extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func change_scene(name: String):
	get_tree().change_scene_to_file("res://Scenes/Levels/"+name+".tscn")
	print("Changing Scene to "+name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
