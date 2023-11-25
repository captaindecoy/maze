extends Node2D

var powerup_scene = preload("res://scenes/spread_power_up.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = powerup_scene.instantiate()
	#instance
	instance.type = 'P'
	if owner:
		owner.add_child(instance)
	#add_child(instance)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
