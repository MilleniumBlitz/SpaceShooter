extends SimpleMenu

func _on_item_selected(value):
	._on_item_selected(value)
	match value:
		0:
			
			Game.main.load_main_level()
#			Game.main.load_menu("res://Menu/Selection/SelectionMenu.tscn")
			
		1:
			#QUITTER
			get_tree().quit()
