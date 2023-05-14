extends Control

@onready var _count_text: RichTextLabel = $counter
var par: int

func _ready():
	ShotCounter.score_update.connect(_on_score_update)
	par = SceneManager.get_level_data().par
	_count_text.text = "0/" + str(par)

func _on_score_update(score: int):
	_count_text.text = str(score) + "/" + str(par)
