extends Node2D

onready var enemy = preload("res://entities/enemy/Enemy.tscn")
onready var player = preload("res://entities/player/Player.tscn")

func _on_IntroTimer_timeout():
	
	#SPAWN DES ENNEMIES
	var p = Vector2(750,50)
	for enemy_s in range(LevelManager.number_of_ennemies):
		var new_enemy = enemy.instance()
		new_enemy.global_position = p
		find_node("Enemies").add_child(new_enemy)
		p.y += 100
		
	
	LevelManager.connect("player_hit", $CanvasLayer/HealthUI, "player_hit")
	for enemy in $Enemies.get_children():
		enemy.connect("enemy_dead", LevelManager, "enemy_dead")
		enemy.connect("enemy_escaped", LevelManager, "enemy_escaped")
		enemy.connect("enemy_crashed", LevelManager, "enemy_crashed")
