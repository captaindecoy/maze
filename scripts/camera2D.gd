extends Camera2D

var shake : float = 0
var starting_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	starting_position = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = starting_position
	position.x += randf_range(-shake, shake)
	position.y += randf_range(-shake, shake)
	if (shake > 0.1):
		shake *= 0.9;
	else:
		shake = 0;
		#position = starting_position
	#pass
	pass
