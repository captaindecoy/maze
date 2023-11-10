extends Node2D

var radius : int = 75

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass
	
func _draw():
	draw_arc(Vector2.ZERO, radius * owner.timer, 0, TAU, 24, Color.GREEN, 1)
	#pass
