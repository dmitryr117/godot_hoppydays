extends KinematicBody2D

const SPEED = 500

var motion = Vector2(0, 0)
var move_left = false
var move_right = false

func _ready():
	pass

func _physics_process(delta):
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
	move_and_slide(motion)
