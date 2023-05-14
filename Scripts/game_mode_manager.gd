extends Node

enum Mode {
	TANKS = 1,
	GOLF = 2
}

var current_mode: Mode = Mode.TANKS

signal change_mode(new_mode: Mode)

func _ready():
	change_mode.connect(_on_change_mode)
	
func _on_change_mode(new_mode: Mode):
	current_mode = new_mode
	
func get_current_mode() -> Mode:
	return current_mode
