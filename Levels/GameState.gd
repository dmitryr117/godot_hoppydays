extends Node2D

var lives = 3
var coins = 0
var life_cost = 10

func _ready():
	add_to_group("Gamestate")
	update_lives(lives)

func update_lives(lives):
	get_tree().call_group("GUI", "update_lives", lives)

func hurt():
	lives -= 1
	$Player.hurt()
	update_lives(lives)
	if lives < 0:
		end_game()

func coin_up():
	coins += 1
	get_tree().call_group("GUI", "update_coins", coins)
	var coin_multiple = (coins % life_cost) == 0
	if coin_multiple:
		life_up()
		
func life_up():
	lives += 1
	update_lives(lives)

func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
	
func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")
