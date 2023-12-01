class_name Player extends CharacterBody2D

@export var speed = 250
@export var friction = 0.01
@export var acceleration = 0.1
var fire_rate = 10
var fire_rate_timer = 0
var current_fire_mode = 0
var power_up_rate = 3
var power_up_timer = -1

var spread_level = 0

enum fire_modes {
	NORMAL, 
	DOUBLE, 
	SPREAD}

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
	
	if power_up_timer > 0:
		power_up_timer -= delta
		print(power_up_timer)
	elif power_up_timer < 0 and power_up_timer != -1:
		current_fire_mode = fire_modes.NORMAL
		spread_level = 0
		power_up_timer = -1
	
	# Right stick aiming and firing
	var rs_look : Vector2 = Vector2(0,0)
	var deadzone = 0.3
	rs_look.y = Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)
	rs_look.x = Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
	if rs_look.length() >= deadzone:
		rotation = rs_look.angle()
		if fire_rate_timer == 0:
			fire_gun()
			
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
	match (current_fire_mode):
		fire_modes.NORMAL:
			create_bullet(Vector2.ZERO, 0)
			
		fire_modes.DOUBLE:
			create_bullet(Vector2(1,0).rotated(rotation + PI/2), 0)
			create_bullet(Vector2(-1,0).rotated(rotation + PI/2), 0)
			
		fire_modes.SPREAD:
			if spread_level == 1:
				create_bullet(Vector2(1,0).rotated(rotation + PI/2), PI/8)
				create_bullet(Vector2(-1,0).rotated(rotation + PI/2), -PI/8)
		
			if spread_level == 2:
				create_bullet(Vector2.ZERO, 0)
				create_bullet(Vector2(1,0).rotated(rotation + PI/2), PI/8)
				create_bullet(Vector2(-1,0).rotated(rotation + PI/2), -PI/8)
			
func set_current_fire_mode(type : String):
	match(type):
		"S":
			if spread_level < 3:
				spread_level += 1
				current_fire_mode = fire_modes.SPREAD
		"D":
			current_fire_mode = fire_modes.DOUBLE
			
	#current_fire_mode = power_up_type
	power_up_timer = power_up_rate

func create_bullet(bullet_position : Vector2, bullet_rotation : float):
	var instance = bullet_scene.instantiate()
	if owner:
		owner.add_child(instance)
	#add_child(instance)
	instance.transform = transform
	var move_xy = bullet_position * 12
	instance.position += move_xy
	instance.rotation += bullet_rotation
	fire_rate_timer = fire_rate
