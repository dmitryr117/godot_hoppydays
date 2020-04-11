extends AnimatedSprite

func _on_Player_animate(motion, on_floor):
	if not on_floor:
		play("jump")
	elif motion.x != 0:
		if motion.x < 0:
			flip_h = true
		else:
			flip_h = false
		play("walk")
	else:
		play("idle")
