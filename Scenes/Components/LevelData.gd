extends Node2D

@export var par:int
@export var current_level:String
@export var next_level:String

func _ready():
	ShotCounter.update_level(par,current_level,next_level)
	ShotCounter._update_dict(current_level,0)


