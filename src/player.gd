extends KinematicBody2D

class_name Player

export (int) var speed = 75
export (int) var max_speed = 200
export (int) var jump_height = -800
export (int) var gravity = 20
# Friction percentage, expressed as a float between 0 and 1
export (float) var friction = 0.2
export (float) var airFriction = 0.05
var velocity = Vector2()

func _physics_process(delta):
	var isFriction = false
	
	velocity.y += gravity
	
	# Left and Right Movement
	if Input.is_action_pressed("move_left"):
		$sprite.flip_h = true
		velocity.x = max(velocity.x-speed, -max_speed)
	elif Input.is_action_pressed("move_right"):
		$sprite.flip_h = false
		velocity.x = min(velocity.x+speed, max_speed)
	# Friction
	else:
		isFriction = true
		velocity.x = lerp(velocity.x, 0, friction)
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_height
		if(isFriction == true):
			velocity.x = lerp(velocity.x, 0, friction)
	else:
		if(isFriction == true):
			velocity.x = lerp(velocity.x, 0, airFriction)
	velocity = move_and_slide(velocity, Vector2(0,-1))

