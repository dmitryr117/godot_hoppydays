extends KinematicBody2D

const SPEED = 500
const GRAVITY = 50
const UP = Vector2(0, -1)
const JUMP_SPEED = 1000

var motion = Vector2(0, 0)
var move_left = false
var move_right = false
var on_floor = false

func _ready():
	pass

func _physics_process(delta):
	on_floor = is_on_floor()
	apply_gravity()
	move()
	jump()
	move_and_slide(motion, UP)
	
func apply_gravity():
	if on_floor:
		motion.y = +5
	else:
		motion.y += GRAVITY
		
func jump():
	if Input.is_action_just_pressed('jump') and on_floor:
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
