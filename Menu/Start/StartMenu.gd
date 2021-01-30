extends SimpleMenu

func _on_item_selected(value):
	
	match value:
		0:
			#DEMARRER NIVEAU 1
			LevelManager.start_level(1)
		1:
			#QUITTER
			get_tree().quit()
