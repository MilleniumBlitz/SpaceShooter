extends Node

#GERE TOUT ICI CE QUI CONCERNE LE NIVEAU ET LE LES PROCHAINS NIVEAUX A JOUER
#LE SCORE ?
#VICTOIRE/DEFAITE
var current_level
var level_started = false
var number_of_ennemies
var nbr_dead_enemies = 0
var enemy_type
var health = 3

var waves

signal player_hit(health)

var victory = false

func start_level(level_number):
	level_started = false
	current_level = level_number
	nbr_dead_enemies = 0
	health = 3
	
	var level_stats = load("res://levels/level" + str(level_number) + ".tres")
	if level_stats:
		waves = level_stats.waves
		get_tree().change_scene("res://levels/base/BaseLevel.tscn")

func enemy_dead():
	#UN ENNEMI MEURT OU S"ECHAPPE
	nbr_dead_enemies += 1
	if number_of_ennemies == nbr_dead_enemies:
		game_over(true)

func enemy_escaped():
	nbr_dead_enemies += 1
	hit_player()

func enemy_crashed():
	nbr_dead_enemies += 1
	hit_player()
	
func hit_player():
	health -= 1
	if health == 0:
		
		#LE JOUEUR EST MORT, DEFAITE
		game_over(false)
	elif health > 0:
		#LE JOUEUR EST TOUCHE
		emit_signal("player_hit", health)

func game_over(value):
	victory = value
	get_tree().change_scene("res://menu/end/EndMenu.tscn")

func restart():
	start_level(current_level)
