extends Area2D

@export var PlayerNodePath : NodePath
@export var speed: int = 100
@onready var player = $"../Player"
var state : int
var timer: float = 1.0

enum states {SPAWNING, CHASING}

signal died

func _ready():
	#player = $"../Player"
	state = states.SPAWNING
	$Sprite2D.visible = false
	$CollisionShape2D.disabled = true
	#print(name)
	#player = $Player
	pass

func _physics_process(delta):	
	#var player = get_node(PlayerNodePath)
	#player = $Player
	#player = get_node($Player)
	match state:
		states.SPAWNING:
			if timer > 0:
				timer -= delta
				#queue_redraw()
			else:
				state = states.CHASING
				$Sprite2D.visible = true
				$CollisionShape2D.disabled = false
				$SpawnCircle.queue_free()
		states.CHASING:
			if player:
				rotation = position.angle_to_point(player.position)
				position += transform.x * speed * delta

func die():
	#score.text = "10"
	died.emit()
	queue_free()


func _on_body_entered(body):
	#print(body.name)
	body.die()
	pass # Replace with function body.
	
#func _draw():
	#draw_circle(position, 5, Color.GREEN)
	#print(timer)
	#if state == states.SPAWNING:
	#	draw_arc(Vector2.ZERO, 100 * timer, 0, TAU, 32, Color.GREEN, 1)
	#pass
