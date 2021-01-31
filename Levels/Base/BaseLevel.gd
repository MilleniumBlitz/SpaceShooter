extends Node2D

var player = preload("res://entities/player/Player.tscn")
var number_of_enemies_to_kill = 3
var nbr_dead_enemies = 0

func _ready():
	
	LevelManager.connect("player_hit", $CanvasLayer/HealthUI, "player_hit")
	for enemy in $Enemies.get_children():
		enemy.connect("enemy_dead", self, "enemy_dead")
		enemy.connect("enemy_escaped", self, "enemy_escaped")
	
func enemy_dead():
	print(" un ennemi est mort ")
	nbr_dead_enemies += 1
	if number_of_enemies_to_kill == nbr_dead_enemies:
		print("VICTORY")
#		LevelManager.game_over(1)

func enemy_escaped():
	print(" un ennemi s'échape ")
	#RETIRER UNE VIE AU JOUEUR
	LevelManager.hit_player()
		
func _on_EndArea_area_entered(area):
	pass
#	if area is Ennemy:
#		#TOUCHER LE JOUEUR ICI / HIT POUR LUI ENLEVER UNE VIE
#		LevelManager.hit_player()
