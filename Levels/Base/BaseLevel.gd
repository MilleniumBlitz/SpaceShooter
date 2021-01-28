extends Node2D

var player = preload("res://entities/player/Player.tscn")

var over = false

func _ready():
	
	# ADDING THE PLAYER TO THE SCENE
	var new_player = player.instance()
	new_player.position = Vector2(100,100)
	add_child(new_player)
	
func _process(delta):
	
	# CHECK IF ALL ENEMIES ARE DEAD
	if over == false:
		if $Enemies.get_child_count() == 0:
			over = true
			print("VICTORY")
			get_tree().change_scene("res://Menu/End/EndMenu.tscn")


func _on_EndArea_area_entered(area):
	
	if area is Ennemy:
		print("FAIL")
		print("GAME OVER")
		get_tree().change_scene("res://Menu/End/EndMenu.tscn")
