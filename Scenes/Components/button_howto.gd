extends Button

@export var panel:Control

func _on_button_pressed():
	if panel.visible:
		panel.hide()
	else:
		panel.show()

