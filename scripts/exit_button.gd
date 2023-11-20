extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(self._button_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _button_pressed():
	#print(get_node("/root/Game").name)
	#print($"root/Game".name)
	get_tree().quit()
