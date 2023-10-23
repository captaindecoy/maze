extends CharacterBody2D

@export var speed = 200
@export var friction = 0.01
@export var acceleration = 0.1

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
	return input

func _physics_process(delta):
	#if(Input.is_action_just_pressed("shoot")):
		#var instance = bullet_scene.instantiate()
		#owner.add_child(instance)
		#instance.transform = transform
		#instance.rotation = rotation
		#instance.transform.x = transform.x
	var rs_look : Vector2 = Vector2(0,0)
	var deadzone = 0.3
	rs_look.y = Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)
	rs_look.x = Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
	if rs_look.length() >= deadzone:
		rotation = rs_look.angle()
		var instance = bullet_scene.instantiate()
		owner.add_child(instance)
		instance.transform = transform
		#$AnimatedSprite2D.rotation = rs_look.angle()
	#$AnimatedSprite2D.look_at(get_global_mouse_position())
	#$AnimatedSprite2D.look_at(rightStick)
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()
