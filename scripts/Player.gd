extends CharacterBody2D

@export var speed = 250
@export var friction = 0.01
@export var acceleration = 0.1
var fire_rate = 10
var fire_rate_timer = 0
var fire_mode = 0


var bullet_scene = preload("res://scenes/bullet.tscn")
var shot_sound = preload("res://sounds/default_laser_shoot.wav")

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
			fire_gun()
			
			#$AudioStreamPlayer.stream = shot_sound
			#$AudioStreamPlayer.play()
			#var instance = bullet_scene.instantiate()
			#if owner:
			#	owner.add_child(instance)
			#add_child(instance)
			#instance.transform = transform
			#fire_rate_timer = fire_rate
			
	# Left stick moving
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	
	move_and_slide()
	
func die():
	get_tree().reload_current_scene()

func fire_gun():
	$AudioStreamPlayer.stream = shot_sound
	$AudioStreamPlayer.play()
	match (fire_mode):
		0:
			var instance = bullet_scene.instantiate()
			if owner:
				owner.add_child(instance)
			#add_child(instance)
			instance.transform = transform
			fire_rate_timer = fire_rate
		1:
			var instance = bullet_scene.instantiate()
			if owner:
				owner.add_child(instance)
			#add_child(instance)
			instance.transform = transform
#			var move_xy = Vector2(cos(rotation + PI/2), sin(rotation + PI/2)) * 12
			var move_xy = Vector2(1,0).rotated(rotation + PI/2) * 12
			instance.position += move_xy
			fire_rate_timer = fire_rate
			
			var instance2 = bullet_scene.instantiate()
			if owner:
				owner.add_child(instance2)
			#add_child(instance)
			instance2.transform = transform
			instance2.position -= move_xy
			fire_rate_timer = fire_rate
	
