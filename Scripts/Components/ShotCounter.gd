extends Node2D

@onready var shots = 0
@onready var total_score = 0
@onready var _par = 0
var scores:Dictionary

var current_level: String
var next_level: String

signal update_ui(score:int)
signal end_level(hole_score:int,total_score:int,cur_level:String)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _update_dict(level:String, score:int):
	scores[level] = score

func _update_ui():
	update_ui.emit(shots)
func update_level(par:int,_current_level:String,_next_level:String): #set par, current level, and next level when level loads
	_par = par
	current_level = _current_level
	next_level = _next_level
	shots = 0
	print("Hole Par: " +str(_par))
	print("Current Level: "+current_level)
	print("Next Level: "+next_level)
func increase_shots():
	shots = shots+1
	print("Shots: " + str(shots))
	_update_ui()

func finish_level():
	total_score = (total_score +(shots-_par))
	print("Current score is "+str(total_score))
	scores[current_level] = (shots-_par)
	for element in scores:
		end_level.emit(scores[element],total_score,element)

func _on_golf_ball_increase_shot():
	increase_shots()


func _on_player_tank_increase_shot():
	increase_shots()
