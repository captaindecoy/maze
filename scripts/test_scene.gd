extends Node2D

var powerup_scene = preload("res://scenes/power_up.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
#	var instance = powerup_scene.instantiate()
#	print(instance.name)
#	instance.type = 'P'
#	print(instance.type)
#	instance.position = Vector2(200, 200)
#	add_child(instance)
#	#add_child(instance)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PowerUpMeter.value = $Player.power_up_timer
	$PowerUpLevel.text = "LVL " + str($Player.spread_level)
	pass
