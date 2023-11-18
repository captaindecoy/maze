extends Node2D

class_name Game

var score : int = 0
#var shake : float = 0
#var starting_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreLabel.text = "SCORE: " + str(score)
#	starting_position = position
	pass # Replace with function body.

#func _unhandled_input(event):
#	print(event.as_text())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	position = starting_position
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !(get_tree().paused)
	if Input.is_action_just_pressed('toggle_fullscreen'):
		var mode = DisplayServer.window_get_mode()
		if mode == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			
#	position.x += randf_range(-shake, shake)
#	position.y += randf_range(-shake, shake)
#	if (shake > 0.1):
#		shake *= 0.9;
#	else:
#		shake = 0;
		#position = starting_position
	#pass

func _on_baddie01_died():
	#print("signal captured!")
	score += 10
	$Camera2D.shake = 10.0
	$ScoreLabel.text = "SCORE: " + str(score)
	pass
