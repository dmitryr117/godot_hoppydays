extends KinematicBody2D

const SPEED = 1000
const GRAVITY = 80
const UP = Vector2(0, -1)
const JUMP_SPEED = 1500

var motion = Vector2(0, 0)
var move_left = false
var move_right = false

func _ready():
	pass

func _physics_process(delta):
	apply_gravity()
	move()
	jump()
	animate()
	move_and_slide(motion, UP)
	
func apply_gravity():
	if is_on_floor():
		motion.y = +5
	else:
		motion.y += GRAVITY
		
func jump():
	if Input.is_action_just_pressed('jump') and is_on_floor():
		motion.y -= JUMP_SPEED
		
func move():
	move_left = Input.is_action_pressed("left")
	move_right = Input.is_action_pressed("right")
	if move_left and move_right:
		motion.x = 0
	elif move_left:
		motion.x = -SPEED
	elif move_right:
		motion.x = SPEED
	else:
		motion.x = 0
		
func animate():
	if motion.y < 0:
		$AnimatedSprite.play("jump")
	elif motion.x != 0:
		if motion.x < 0:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")
	















