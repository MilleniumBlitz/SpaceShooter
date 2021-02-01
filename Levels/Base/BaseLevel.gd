extends Node2D

onready var enemy = preload("res://entities/enemy/Enemy.tscn")
onready var player = preload("res://entities/player/Player.tscn")

var nbr_dead_enemies = 0

func _ready():
	
	#SPAWN DES ENNEMIES
	var p = Vector2(600,50)
	for enemy_s in range(LevelManager.number_of_ennemies):
		var new_enemy = enemy.instance()
		new_enemy.global_position = p
		find_node("Enemies").add_child(new_enemy)
		p.y += 100
	
	LevelManager.connect("player_hit", $CanvasLayer/HealthUI, "player_hit")
	for enemy in $Enemies.get_children():
		enemy.connect("enemy_dead", self, "enemy_dead")
		enemy.connect("enemy_escaped", self, "enemy_escaped")
		enemy.connect("enemy_crashed", self, "enemy_crashed")
	
func enemy_dead():

	#UN ENNEMI MEURT OU S"ECHAPPE
	nbr_dead_enemies += 1
	if LevelManager.number_of_ennemies == nbr_dead_enemies:
		LevelManager.game_over(1)

func enemy_escaped():
	enemy_dead()
	LevelManager.hit_player()

func enemy_crashed():
	enemy_dead()
	LevelManager.hit_player()
