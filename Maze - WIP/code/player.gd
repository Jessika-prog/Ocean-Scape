extends KinematicBody2D

#const GRAVITY = 1000
const UP = Vector2(0, -1)
const ACCEL = 10

var vel = Vector2()
export (int) var max_speed = 200

func _ready():
	pass

func _physics_process(delta):
	movement_loop()
	vel.y += delta
	vel = move_and_slide(vel, UP)

func movement_loop():

	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	var dirX = int(right) - int(left)
	var dirY = int(down) - int(up)
	
	if dirX == -1:
		vel.x = max(vel.x - ACCEL, -max_speed)

		
	elif dirX == 1:
		vel.x = min(vel.x + ACCEL, max_speed)

		
	elif dirY == -1:
		vel.y = max(vel.y - ACCEL, -max_speed)

		
	elif dirY == 1:
		vel.y = min(vel.y + ACCEL, max_speed)


	else:
		vel.x = lerp(vel.x, 0, 0.15)
