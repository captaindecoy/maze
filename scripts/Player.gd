extends CharacterBody2D

@export var speed = 200
@export var friction = 0.01
@export var acceleration = 0.1
var fire_rate = 10
var fire_rate_timer = 0

var bullet_scene = preload("res://scenes/bullet.tscn")

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('move_right'):
		input.x += 1
	if Input.is_action_pressed('move_left'):
		input.x -= 1
	if Input.is_action_pressed('move_down'):
		input.y += 1
	if Input.is_action_pressed('move_up'):
		input.y -= 1
	if Input.is_action_pressed('restart'):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed('toggle_fullscreen'):
		var mode = DisplayServer.window_get_mode()
		if mode == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	return input

func _physics_process(delta):
	if fire_rate_timer > 0:
		fire_rate_timer -= 1
		
	# Right stick aiming and firing
	var rs_look : Vector2 = Vector2(0,0)
	var deadzone = 0.3
	rs_look.y = Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)
	rs_look.x = Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
	if rs_look.length() >= deadzone:
		rotation = rs_look.angle()
		if fire_rate_timer == 0:
			var instance = bullet_scene.instantiate()
			owner.add_child(instance)
			instance.transform = transform
			fire_rate_timer = fire_rate
			
	# Left stick moving
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	
	move_and_slide()
	
func die():
	get_tree().reload_current_scene()
	#var restart_event = InputEventAction.new()
	#restart_event.action = "restart"
	#restart_event.pressed = true
	#Input.parse_input_event(restart_event)
	#queue_free()
