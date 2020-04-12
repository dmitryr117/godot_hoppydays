extends AnimationPlayer


func _ready():
	randomize()
	var anim_length = get_animation(get_autoplay()).length
	play(get_autoplay())
	var offset : float = randf() * anim_length
	advance(offset)
	#seek(offset, true)
	
