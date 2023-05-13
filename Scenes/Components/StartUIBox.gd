extends Control
@export var level_name:RichTextLabel
@export var par:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_level()


func _update_level():
	pass
	#level_name.set_text(ShotCounter.current_level)
	var level_data: LevelData = SceneManager.get_level_data()
	par.set_text(str(level_data.par))


func _on_start_level_pressed():
	get_node("Scorecard").hide()
