extends Node2D

class_name Game

var score : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "SCORE: " + str(score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !(get_tree().paused)
	pass

func _on_baddie01_died():
	print("signal captured!")
	score += 10
	$Label.text = "SCORE: " + str(score)
	pass
