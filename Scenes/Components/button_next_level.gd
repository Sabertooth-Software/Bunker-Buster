extends Button

func _on_pressed():
	SceneManager.change_scene(ShotCounter.next_level)
