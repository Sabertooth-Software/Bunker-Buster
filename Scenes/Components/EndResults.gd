extends Control
@export var score_container: BoxContainer
@export var holes: BoxContainer
@export var card: Control
@export var total_score: Label

func _ready():
	SceneManager.level_complete.connect(_on_level_complete)
	for level in SceneManager.level_data:
		var level_number: int = SceneManager.level_data[level].level_number
		var label: Label = Label.new()
		label.text = "Hole " + str(level_number)
		label.name = str(level_number)
		holes.add_child(label)
		
		var score_label: Label = Label.new()
		if ShotCounter.scores.get(level) != null:
			score_label.text = str(ShotCounter.scores[level])
		else:
			score_label.text = "0"
		score_label.name = str(level_number)
		score_container.add_child(score_label)
		
	card.hide()

func set_score(score:int):
	var current_level: int = SceneManager.current_level.level_number
	score_container.get_node(str(current_level)).set_text(str(score));

func _on_level_complete():
	set_score(ShotCounter.get_current_score())
	var current_par: int = 0
	total_score.set_text("Total Score: "+ ShotCounter.get_total_score())
	card.show()
