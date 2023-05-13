extends Control

@onready var _count_text:RichTextLabel= $counter
# Called when the node enters the scene tree for the first time.
func _ready():
	ShotCounter.update_ui.connect(_on_update_ui)


func _on_update_ui(score:int):
	_count_text.text = (str(score))
func _process(delta):
	pass
