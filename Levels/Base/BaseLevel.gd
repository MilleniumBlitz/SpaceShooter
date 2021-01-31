extends Node2D

var player = preload("res://entities/player/Player.tscn")
var number_of_enemies_to_kill = 3
var nbr_dead_enemies = 0

func _ready():
	
	LevelManager.connect("player_hit", $CanvasLayer/HealthUI, "player_hit")
	for enemy in $Enemies.get_children():
		enemy.connect("enemy_dead", self, "enemy_dead")
		enemy.connect("enemy_escaped", self, "enemy_escaped")
		enemy.connect("enemy_crashed", self, "enemy_crashed")
	
func enemy_dead():

	#UN ENNEMI EST TUE PAR LE JOUEUR
	nbr_dead_enemies += 1
	if number_of_enemies_to_kill == nbr_dead_enemies:
		LevelManager.game_over(1)

func enemy_escaped():
	#RETIRER UNE VIE AU JOUEUR
	LevelManager.hit_player()

func enemy_crashed():
	#LE JOUEUR A PERCUTE UN ENNEMI
	LevelManager.hit_player()
