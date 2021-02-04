extends SimpleMenu

func _on_item_selected(value):
	._on_item_selected(value)
	match value:
		0:
			get_tree().change_scene("res://Menu/Selection/SelectionMenu.tscn")
		1:
			#QUITTER
			get_tree().quit()
