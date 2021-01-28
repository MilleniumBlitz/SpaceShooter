extends SimpleMenu

func _on_item_selected(value):
	
	match value:
		0:
			#DEMARRER NIVEAU 1
			get_tree().change_scene("res://Levels/Level1.tscn")
		1:
			#QUITTER
			get_tree().quit()
