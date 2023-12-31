extends Area2D

@export var speed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.flip_h = true;
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.flip_h = false;
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	
	#move_
