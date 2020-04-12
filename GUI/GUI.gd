extends CanvasLayer

func _ready():
	pass
	
func update_lives(lives):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives)
	
func update_coins(coins):
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)
