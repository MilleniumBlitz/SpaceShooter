extends Node

#GERE TOUT ICI CE QUI CONCERNE LE NIVEAU ET LE LES PROCHAINS NIVEAUX A JOUER
#LE SCORE ?
#VICTOIRE/DEFAITE
var current_level_index
var level_started = false
var victory = false

var number_of_enemies = 0
var nbr_dead_enemies = 0
var waves

func start_level(level_number):
	level_started = false
	current_level_index = level_number
	nbr_dead_enemies = 0
	number_of_enemies = 0
	
	PlayerManager.health = 10
	PlayerManager.max_health = 10
		
	var level_stats = load("res://levels/level" + str(level_number) + ".tres")
	if level_stats:
		waves = level_stats.waves
		for wave in waves:
			number_of_enemies += wave.enemies.size()
		
		get_tree().change_scene("res://levels/base/BaseLevel.tscn")
				
func enemy_dead():
	
	# UN ENNEMI MEURT
	nbr_dead_enemies += 1
	if number_of_enemies == nbr_dead_enemies:
		win()

func enemy_escaped():
	
	enemy_dead()
	
	# UN ENNEMI S'ECHAPPE
#	nbr_dead_enemies += 1
#	if number_of_enemies == nbr_dead_enemies:
#		win()
	PlayerManager.hit_player()

func enemy_crashed():
	
	enemy_dead()
	
	# UN ENNEMI SE CRACH CONTRE LE JOUEUR
#	nbr_dead_enemies += 1
	PlayerManager.hit_player()

func game_over():
	victory = false
	get_tree().change_scene("res://menu/end/EndMenu.tscn")
	
func win():
	victory = true
	get_tree().change_scene("res://menu/end/EndMenu.tscn")

func restart():
	start_level(current_level_index)
