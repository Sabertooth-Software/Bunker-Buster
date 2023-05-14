extends Control

@onready var _count_text: RichTextLabel = $counter
var par: int

func _ready():
	ShotCounter.score_update.connect(_on_score_update)
	par = SceneManager.get_level_data().par
	_set_text(0)

func _on_score_update(score: int):
	_set_text(score)

func _set_text(score: int):
	_count_text.text = str(score) + "/" + str(par)
	if score <= par:
		_count_text.add_theme_color_override("default_color", Color.GREEN)
	else:
		_count_text.add_theme_color_override("default_color", Color.RED)
		
