extends Area2D

@export var PlayerNodePath : NodePath
@export var speed: int = 90
var player

func _ready():
	player = $"../Player"
	#print(name)
	#player = $Player
	pass

func _physics_process(delta):	
	#var player = get_node(PlayerNodePath)
	#player = $Player
	#player = get_node($Player)
	if player:
		rotation = position.angle_to_point(player.position)
		position += transform.x * speed * delta

func die():
	queue_free()


func _on_body_entered(body):
	#print(body.name)
	body.die()
	pass # Replace with function body.
	
func _draw():
	#draw_circle(position, 5, Color.GREEN)
	draw_arc(Vector2.ZERO, 30, 0, TAU, 32, Color.GREEN, 1)
	#pass
