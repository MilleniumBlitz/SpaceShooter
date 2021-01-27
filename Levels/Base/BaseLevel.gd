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
			print("Victoire")
			$CanvasLayer/EndMenu.visible = true
