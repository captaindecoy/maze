extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass
	
func _draw():
	draw_arc(Vector2.ZERO, 100 * owner.timer, 0, TAU, 32, Color.GREEN, 1)
	#pass
