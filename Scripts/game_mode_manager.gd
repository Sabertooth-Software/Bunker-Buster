extends Node

enum Mode {
	TANKS = 1,
	GOLF = 2
}

var current_mode: Mode = Mode.TANKS

signal start_tank_mode()
signal start_golf_mode()

func _ready():
	start_tank_mode.connect(_on_start_tank_mode)
	start_golf_mode.connect(_on_start_golf_mode)
	
func _on_start_tank_mode():
	print("tanks")
	current_mode = Mode.TANKS
	
func _on_start_golf_mode():
	print("golf")
	current_mode = Mode.GOLF
	
func get_current_mode() -> Mode:
	return current_mode
