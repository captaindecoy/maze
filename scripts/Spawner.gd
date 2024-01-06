extends Node2D

var baddie01_scene = preload("res://scenes/baddie_01.tscn")
var power_up_scene = preload("res://scenes/power_up.tscn")
var timer : float = 1.0
var level_time : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(get_parent().name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta : float):
	level_time += delta
	$"../LevelTime".text = "Level Timer: " + str(level_time).pad_decimals(2)
	#var result = randi_range(0,30)
	#print(result)
	#if result == 1:
	#print(delta)
	if timer > 0:
		timer -= delta
	else:
		#print("")
		var instance = baddie01_scene.instantiate()
		instance.position = Vector2(randi_range(-170, 760),randi_range(-64, 364))
		#instance.PlayerNodePath = get_node("Player")
		owner.add_child(instance)
		#add_child(instance)
		#print(owner)
		instance.died.connect(get_node("/root/Game")._on_baddie01_died)
		timer = 1.0
		#print(floor(level_time))
		if int(floor(level_time)) % 5 == 0:
			var power_up = power_up_scene.instantiate()
			power_up.position = Vector2(randi_range(-170, 760),randi_range(-64, 364))
			power_up.power_up_type = randi_range(1,2)
			#instance.PlayerNodePath = get_node("Player")
			owner.add_child(power_up)
			#power_up.type = 'S'
	pass
