extends Node2D

var font = load('res://fonts/PrStart.ttf')
var radius : int = 20
var type : String
enum PowerUpType {NONE, SPREAD, POWER, EXPLOSIVE}
@export var power_up_type: PowerUpType
#@export_enum("Spread", "Power") var powerup_type : int

# Called when the node enters the scene tree for the first time.
func _ready():
	match(power_up_type):
		PowerUpType.SPREAD:
			type = 'S'
		PowerUpType.POWER:
			type = 'P'

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print($Area2D/CollisionShape2D.shape.radius)
	queue_redraw()
	pass
	
func _draw():
	draw_arc(Vector2.ZERO, radius, 0, TAU, 24, Color.RED, 3)
	draw_char(font, Vector2(-7, 7), type, 20, Color.RED) #Magic numbers!

func _on_area_2d_body_entered(body):
	print(body.name)
	#body.fire_mode = 1
	body.fire_mode = power_up_type
	body.power_up_timer = body.power_up_rate
#	match(power_up_type):
#		PowerUpType.SPREAD:
#			body.fire_mode = 1
#		PowerUpType.POWER:
#			body.fire_mode = 2
	pass # Replace with function body.
