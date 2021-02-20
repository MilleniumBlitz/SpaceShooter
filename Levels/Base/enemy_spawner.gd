extends Node2D

onready var enemy = preload("res://entities/enemy/enemy.tscn")


var rng_enemies_nbr = RandomNumberGenerator.new()
var rng_enemies_positions = RandomNumberGenerator.new()

var max_enemies_per_wave = 3

func start():
	$SpawnTimer.start()
	spawn_wave()

func spawn_wave():
	
	# NUMBER OF ENNEMIES IN THE WAVE
	rng_enemies_nbr.randomize()
	var my_random_number = rng_enemies_nbr.randi_range(1, max_enemies_per_wave)
	
	print("Nombre d'ennemies spawnés : " + str(my_random_number))
	
	# POSITIONS OF THE ENNEMIES
	var occupied_positions = []
	for i in range(my_random_number):
		rng_enemies_positions.randomize()
		var random_position = rng_enemies_positions.randi_range(0,4)
		
		while occupied_positions.has(random_position):
			rng_enemies_positions.randomize()
			random_position = rng_enemies_positions.randi_range(0,4)
		
		
		occupied_positions.append(random_position)
		var new_enemy = enemy.instance()
		new_enemy.global_position = find_node("Position2D" + str(random_position)).global_position
		get_parent().add_child(new_enemy)
		print("ennemie spawné")
			
	
	
#	if curr_wave_index <= waves.size() -1:
#		var curr_wave : Wave = waves[curr_wave_index]
#		for i in range(0, curr_wave.enemies.size()):
#
#			var new_enemy = enemy.instance()
#			var enemy_type : EnemyType = curr_wave.enemies[i] 
#			new_enemy.sprite = enemy_type.sprite
#			new_enemy.speed = enemy_type.speed
#			new_enemy.fire_rate = enemy_type.fire_rate
#
#			new_enemy.global_position = find_node("Position2D" + str(i)).global_position
#			new_enemy.connect("enemy_dead", LevelManager, "enemy_dead")
#			new_enemy.connect("enemy_escaped", LevelManager, "enemy_escaped")
#			new_enemy.connect("enemy_crashed", LevelManager, "enemy_crashed")
#			get_parent().add_child(new_enemy)
			
func _on_Timer_timeout():
	#FAIRE QUE LA PROCHAINE VAGUE SPAWN APRES LA MORT DE LA COURANTE
	spawn_wave()
