extends Area2D

@export var PlayerNodePath : NodePath
@export var speed: int = 100

func _physics_process(delta):	
	var player = get_node(PlayerNodePath)
	if player:
		rotation = position.angle_to_point(player.position)
		position += transform.x * speed * delta

func die():
	queue_free()


func _on_body_entered(body):
	print(body.name)
	body.die()
	pass # Replace with function body.
