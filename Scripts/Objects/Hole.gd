extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is GolfBall:
		body.queue_free()
		SceneManager.level_complete.emit()
