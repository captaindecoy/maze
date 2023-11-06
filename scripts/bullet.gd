extends Area2D

@export var speed: int = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	#print(body.name)
	if body.name == "Baddie01":
		body.die()
	queue_free()


func _on_area_entered(area):
	#print(area.name)
	#if area.name == "Baddie01":
	area.die()
	pass # Replace with function body.
