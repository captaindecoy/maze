extends Node2D

var font = load('res://fonts/PrStart.ttf')
var radius : int = 20
var type : String
enum PowerUpType {NORMAL, DOUBLE, SPREAD}
@export var power_up_type: PowerUpType
#@export_enum("Spread", "Power") var powerup_type : int

# Called when the node enters the scene tree for the first time.
func _ready():
	match(power_up_type):
		PowerUpType.DOUBLE:
			type = 'D'
		PowerUpType.SPREAD:
			type = 'S'
		_:
			type = '#'

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print($Area2D/CollisionShape2D.shape.radius)
	print("Power-up type: " + type)
	queue_redraw()
	pass
	
func _draw():
	draw_arc(Vector2.ZERO, radius, 0, TAU, 24, Color.RED, 3)
	draw_char(font, Vector2(-8, 8), type, 20, Color.RED) #Magic numbers!

func _on_area_2d_body_entered(body : Player):
	print(body.name)
	body.set_current_fire_mode(type)
	queue_free()

func set_type(value : String):
	type = value
