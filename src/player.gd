extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = -10000
export (int) var gravity = 20000

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y += jump_speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if (velocity.y > 600):
		velocity.y = 600
	velocity = move_and_slide(velocity, Vector2(0,-1))
