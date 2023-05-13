extends Control
@export var score_container:BoxContainer
@export var card:Control
@export var total_score:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	card.hide()

func set_score(level:String,score:int):
	score_container.get_node(level).set_text(str(score));

func _on_end_level(hole_score:int,_total_score:int,cur_level:String):
	set_score(cur_level,hole_score)
	total_score.set_text("Total Score: "+str(_total_score))
	card.show()
