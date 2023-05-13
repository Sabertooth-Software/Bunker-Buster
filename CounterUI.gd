extends Control

@onready var _count_text: RichTextLabel = $counter
# Called when the node enters the scene tree for the first time.
func _ready():
	ShotCounter.score_update.connect(_on_score_update)

func _on_score_update(score: int):
	_count_text.text = str(score)
