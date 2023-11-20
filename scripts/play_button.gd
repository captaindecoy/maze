extends Button

var test_scene = preload("res://scenes/test_level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(self._button_pressed)
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed('a_button'):
		_button_pressed()

func _button_pressed():
	#print(get_node("/root/Game").name)
	#print($"root/Game".name)
	var instance2 = test_scene.instantiate()
	#$"../..".add_child(instance2)
	get_node("/root/Game").add_child(instance2)
	get_node("/root/Game/TitleScreen").queue_free()
	#queue_free()
