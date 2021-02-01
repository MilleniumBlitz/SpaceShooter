extends Node

#GERE TOUT ICI CE QUI CONCERNE LE NIVEAU ET LE LES PROCHAINS NIVEAUX A JOUER
#LE SCORE ?
#VICTOIRE/DEFAITE
var current_level

var number_of_ennemies
var health = 3

signal player_hit(health)

var victory

func start_level(level_number):
	current_level = level_number
	
	var level_stats = load("res://Levels/Level" + str(level_number) + ".tres")
	if level_stats:
		number_of_ennemies = level_stats.number_of_ennemies
		get_tree().change_scene("res://Levels/Base/BaseLevel.tscn")

func hit_player():
	health -= 1
	if health == 0:
		#GAME OVER
		#LE JOUEUR EST MORT, DEFAITE
		game_over(0)
	elif health > 0:
		emit_signal("player_hit", health)

func game_over(value):
	
	victory = value
	get_tree().change_scene("res://Menu/End/EndMenu.tscn")

func restart():
	health = 3
	start_level(current_level)
