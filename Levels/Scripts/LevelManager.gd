extends Node

#GERE TOUT ICI CE QUI CONCERNE LE NIVEAU ET LE LES PROCHAINS NIVEAUX A JOUER
#LE SCORE ?
#VICTOIRE/DEFAITE
var current_level
var level_started = false
var victory = false

var number_of_enemies = 0
var nbr_dead_enemies = 0
var waves

#PLAYER
var health setget set_health
var max_health 
signal player_hit(value)

signal health_changed(value)
signal max_health_changed(value)

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	
func set_max_health(value):
	max_health = value
	emit_signal("max_health_changed", max_health)

func start_level(level_number):
	level_started = false
	current_level = level_number
	nbr_dead_enemies = 0
	number_of_enemies = 0
	
	health = 10
	max_health = 10
	emit_signal("health_changed", health)
	
	var level_stats = load("res://levels/level" + str(level_number) + ".tres")
	if level_stats:
		waves = level_stats.waves
		for wave in waves:
			number_of_enemies += wave.enemies.size()
		
		get_tree().change_scene("res://levels/base/BaseLevel.tscn")

func add_life():
	#Regarder si la max health est = à la health
	if health == max_health:
		#Ajouter un slot
		max_health += 1
		health += 1
		emit_signal("health_changed", health)
		emit_signal("max_health_changed", max_health)
		
	else:
		#Ajouter une vie si il en manque une
		health += 1
		emit_signal("health_changed", health)
		
		
func enemy_dead():
	#UN ENNEMI MEURT OU S"ECHAPPE
	nbr_dead_enemies += 1
	print(nbr_dead_enemies)
	if number_of_enemies == nbr_dead_enemies:
		game_over(true)

func enemy_escaped():
	nbr_dead_enemies += 1
	if number_of_enemies == nbr_dead_enemies:
		game_over(true)
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
		emit_signal("health_changed", health)

func game_over(value):
	victory = value
	get_tree().change_scene("res://menu/end/EndMenu.tscn")

func restart():
	start_level(current_level)
