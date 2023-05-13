extends Node2D
class_name LevelData

@export var par: int
@export var level_number: int
@export var current_level: String
@export var next_level: String

func _init(_level_number: int, _par: int):
	par = _par
	level_number = _level_number
