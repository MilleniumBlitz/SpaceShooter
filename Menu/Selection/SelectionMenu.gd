extends SimpleMenu

func _on_item_selected(value):
	._on_item_selected(value)
	match value:
		0:
			#DEMARRER NIVEAU 1
			LevelManager.start_level(1)
		1:
			#DEMARRER NIVEAU 2
			LevelManager.start_level(2)
