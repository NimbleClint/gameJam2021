extends KinematicBody2D

class_name Player
onready var animator = get_node("AnimationPlayer")

export (int) var speed = 75
export (int) var max_speed = 200
export (int) var jump_height = -800
export (int) var gravity = 20
# Friction percentage, expressed as a float between 0 and 1
export (float) var friction = 0.2
export (float) var airFriction = 0.05
var velocity = Vector2()

func _physics_process(_delta):
	var isFriction = false
	
	velocity.y += gravity
	
	# Left and Right Movement
	if Input.is_action_pressed("move_left"):
		$Sprite.flip_h = true
		animator.play("walk")
		velocity.x = max(velocity.x-speed, -max_speed)
	elif Input.is_action_pressed("move_right"):
		$Sprite.flip_h = false
		animator.play("walk")
		velocity.x = min(velocity.x+speed, max_speed)
	# Friction
	else:
		animator.play("idle_r")
		isFriction = true
		velocity.x = lerp(velocity.x, 0, friction)
	
	# Jumping
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_height
		if(isFriction == true):
			velocity.x = lerp(velocity.x, 0, friction)
	else:
		if velocity.y < 0:
			animator.play("jump")
		else:
			animator.play("fall")
		if(isFriction == true):
			velocity.x = lerp(velocity.x, 0, airFriction)
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	# Interaction Animation
	if Input.is_action_pressed("interact"):
		animator.play("grab")

