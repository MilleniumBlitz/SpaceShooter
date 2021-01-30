extends Node

#GERE TOUT ICI CE QUI CONCERNE LE NIVEAU ET LE LES PROCHAINS NIVEAUX A JOUER
#LE SCORE ?
#VICTOIRE/DEFAITE

var current_level

var health = 3

signal player_hit(health)

var victory

func start_level(level_number):
	current_level = "res://Levels/Level" + str(level_number) + ".tscn"
	restart()

func hit_player():
	health -= 1
	if health == 0:
		#GAME OVER
		#LE JOUEUR EST MORT, DEFAITE
		game_over(0)
	else:
		emit_signal("player_hit", health)

func game_over(value):
	
	victory = value
	get_tree().change_scene("res://Menu/End/EndMenu.tscn")

func restart():
	health = 3
	get_tree().change_scene(current_level)
