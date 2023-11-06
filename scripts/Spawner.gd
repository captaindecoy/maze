extends Node2D

var baddie01_scene = preload("res://scenes/baddie_01.tscn")
var timer: float = 1.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var result = randi_range(0,30)
	#print(result)
	#if result == 1:
	#print(delta)
	if timer > 0:
		timer -= delta
	else:
		#print("")
		var instance = baddie01_scene.instantiate()
		instance.position = Vector2(randi_range(64, 512),randi_range(64, 256))
		#instance.PlayerNodePath = get_node("Player")
		owner.add_child(instance)
		timer = 1.0
	pass
