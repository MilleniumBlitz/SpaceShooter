extends Node

#GERE TOUT ICI CE QUI CONCERNE LE NIVEAU ET LE LES PROCHAINS NIVEAUX A JOUER
#LE SCORE ?
#VICTOIRE/DEFAITE
var current_level
var level_started = false
var number_of_ennemies
var nbr_dead_enemies = 0
var health = 3

signal player_hit(health)

var victory

func start_level(level_number):
	level_started = false
	current_level = level_number
	nbr_dead_enemies = 0
	
	var level_stats = load("res://Levels/Level" + str(level_number) + ".tres")
	if level_stats:
		number_of_ennemies = level_stats.number_of_ennemies
		get_tree().change_scene("res://Levels/Base/BaseLevel.tscn")

func enemy_dead():

	#UN ENNEMI MEURT OU S"ECHAPPE
	nbr_dead_enemies += 1
	if number_of_ennemies == nbr_dead_enemies:
		game_over(1)

func enemy_escaped():
	enemy_dead()
	hit_player()

func enemy_crashed():
	enemy_dead()
	hit_player()

func hit_player():
	health -= 1
	if health == 0:
		#LE JOUEUR EST MORT, DEFAITE
		game_over(0)
	elif health > 0:
		#LE JOUEUR EST TOUCHE
		emit_signal("player_hit", health)

func game_over(value):
	
	victory = value
	get_tree().change_scene("res://Menu/End/EndMenu.tscn")

func restart():
	health = 3
	start_level(current_level)
