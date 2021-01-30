extends Node2D

var player = preload("res://entities/player/Player.tscn")

func _ready():
	
	LevelManager.connect("player_hit", $CanvasLayer/HealthUI, "player_hit")
		
func _process(delta):
	
	if $Enemies.get_child_count() == 0:
		print("VICTORY")
		LevelManager.game_over(1)
		


func _on_EndArea_area_entered(area):
	
	if area is Ennemy:
		print("FAIL")
		print("GAME OVER")
		LevelManager.game_over(0)
