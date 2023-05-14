extends Button

func _on_pressed():
	SceneManager.next_level()


func _on_start_pressed():
	SceneManager.select_level(1)

func _on_quit_pressed():
	get_tree().quit()
