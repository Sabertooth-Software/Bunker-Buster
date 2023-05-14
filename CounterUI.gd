extends Control

@onready var _count_text: RichTextLabel = $counter

func _ready():
	ShotCounter.score_update.connect(_on_score_update)

func _on_score_update(score: int):
	_count_text.text = str(score)
