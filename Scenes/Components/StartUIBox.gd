extends Control
@export var level_name:RichTextLabel
@export var par:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_level()


func _update_level():
	level_name.set_text(ShotCounter.current_level)
	par.set_text(str(ShotCounter._par))


func _on_start_level_pressed():
	get_node("Scorecard").hide()
