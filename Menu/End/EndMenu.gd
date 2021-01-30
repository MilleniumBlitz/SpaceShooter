extends SimpleMenu

func _ready():
	if LevelManager.victory:
		#VICTOIRE
		$Label.text = "VICTOIRE"
	else:
		#DEFAIE
		$Label.text = "DEFAITE"
		

func _on_item_selected(value):
	match value:
		0:
			#RESTART
			LevelManager.restart()
			get_tree().change_scene("res://Levels/Level1.tscn")
			
		1:
			#QUIT
			get_tree().quit()
