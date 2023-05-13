extends Control

@onready var _count_text:RichTextLabel= $counter

func _ready():
	ShotCounter.update_ui.connect(_on_update_ui)

func _on_update_ui(score:int,par:int):
	_count_text.text = (str(score)+"/"+str(par))

