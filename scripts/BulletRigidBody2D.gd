extends Area2D

@export var speed: int = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#rotation += 45;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta
	#print(rotation)


func _on_body_entered(body):
	#print("hit!")
	queue_free()
	pass # Replace with function body.