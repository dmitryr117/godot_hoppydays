extends Area2D

func _on_SpikeTop_body_entered(body):
	print('Entered zone')
	body.hurt()
