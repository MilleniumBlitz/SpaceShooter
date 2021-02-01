extends SimpleMenu

func _on_item_selected(value):
	
	match value:
		0:
			get_tree().change_scene("res://Menu/Selection/SlectionMenu.tscn")
			
			#DEMARRER NIVEAU 1
#			LevelManager.start_level(1)
		1:
			#QUITTER
			get_tree().quit()
