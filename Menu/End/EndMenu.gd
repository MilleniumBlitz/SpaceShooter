extends SimpleMenu

func _ready():
	no_back = true
	if LevelManager.victory:
		#VICTOIRE
		$Title.text = "VICTOIRE"
	else:
		#DEFAIE
		$Title.text = "DEFAITE"
		

func _on_item_selected(value):
	._on_item_selected(value)
	match value:
		0:
			#RESTART
			LevelManager.restart()
			
		1:
			get_tree().change_scene("res://Menu/Selection/SelectionMenu.tscn")
			
		2:
			#QUIT
			get_tree().quit()
