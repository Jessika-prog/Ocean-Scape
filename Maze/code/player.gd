extends KinematicBody2D

#const GRAVITY = 1000
const UP = Vector2(0, -1)
const ACCEL = 10

export (int)var height_jump = -600
var vel = Vector2()
var jump_count = 0
export (int) var max_speed = 200

func _ready():
	pass

func _physics_process(delta):
	movement_loop()
	vel.y += delta
	vel = move_and_slide(vel, UP)

func movement_loop():
	if is_on_floor():
		jump_count = 0

	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_just_pressed("ui_accept")
	
	var dirX = int(right) - int(left)
	
	if dirX == -1:
		vel.x = max(vel.x - ACCEL, -max_speed)
		$Sprite.flip_h = true
		
	elif dirX == 1:
		vel.x = min(vel.x + ACCEL, max_speed)
		$Sprite.flip_h = false

	else:
		vel.x = lerp(vel.x, 0, 0.15)

		
	
	if jump == true and jump_count <2:
		vel.y = -600
		jump_count +=1
		
