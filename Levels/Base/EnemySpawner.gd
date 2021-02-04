extends Node2D

onready var enemy = preload("res://entities/enemy/Enemy.tscn")

var waves = []

var curr_wave_index = -1 

func start():
	$SpawnTimer.start()
	spawn_wave()

func spawn_wave():
	curr_wave_index += 1

	if curr_wave_index <= waves.size() -1:
		print(curr_wave_index)
		var curr_wave : Wave = waves[curr_wave_index]
		for i in range(0, curr_wave.enemies.size()):
					
			var new_enemy = enemy.instance()
			var enemy_type : EnemyType = curr_wave.enemies[i] 
			new_enemy.sprite = enemy_type.sprite
			new_enemy.speed = enemy_type.speed
			new_enemy.fire_rate = enemy_type.fire_rate
			
			new_enemy.global_position = find_node("Position2D" + str(i)).global_position
			new_enemy.connect("enemy_dead", LevelManager, "enemy_dead")
			new_enemy.connect("enemy_escaped", LevelManager, "enemy_escaped")
			new_enemy.connect("enemy_crashed", LevelManager, "enemy_crashed")
			get_parent().add_child(new_enemy)
			
func _on_Timer_timeout():
	#FAIRE QUE LA PROCHAINE VAGUE SPAWN APRES LA MORT DE LA COURANTE
	spawn_wave()
