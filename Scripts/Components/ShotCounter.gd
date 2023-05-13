extends Node2D

@onready var shots = 0
@onready var total_score = 0
@onready var _par = 4

signal update_ui(score:int)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _update_ui():
	update_ui.emit(shots)
	
func set_par(par:int): #set par when level loads
	_par = par

func increase_shots():
	shots = shots+1
	print("Shots: " + str(shots))
	_update_ui()

func finish_level():
	print("Hole Par: " +str(_par))
	total_score = (total_score +(shots-_par))
	print("Current score is "+str(total_score))

func _on_golf_ball_increase_shot():
	increase_shots()


func _on_player_tank_increase_shot():
	increase_shots()
