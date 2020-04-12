extends KinematicBody2D

const SPEED = 1000
const GRAVITY = 100
const UP = Vector2(0, -1)
const JUMP_SPEED = 2500
const WORLD_LIMIT = 4000
const BOOST_MULTIPLIER = 2

signal animate

var motion = Vector2(0, 0)
var move_left = false
var move_right = false

func _ready():
	pass

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)
	
func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("Gamestate", "end_game")
	if ( is_on_floor() and motion.y > 0 ) or is_on_ceiling():
		motion.y = GRAVITY
	else:
		motion.y += GRAVITY
		
func jump():
	if Input.is_action_just_pressed('jump') and is_on_floor():
		motion.y -= JUMP_SPEED
		#$AudioStreamPlayer.stream = load("res://SFX/jump1.ogg")
		$JumpSFX.play()
		
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
	emit_signal("animate", motion, is_on_floor())
	
func hurt():
	#motion.y = 0 #reset gravity motion speed.
	position.y -= 1 # may need to adjust based on gravity and damage thresholds
	yield(get_tree(), "idle_frame")
	motion.y = -JUMP_SPEED
	#$AudioStreamPlayer.stream = load("res://SFX/pain.ogg")
	$PainSFX.play()
	
func boost():
	#motion.y = 0 #reset gravity motion speed.
	position.y -= 1 # may need to adjust based on gravity and damage thresholds
	yield(get_tree(), "idle_frame")
	$JumpSFX.play()
	motion.y = -JUMP_SPEED * BOOST_MULTIPLIER















