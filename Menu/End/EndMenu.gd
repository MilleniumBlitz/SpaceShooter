extends SimpleMenu

func _on_item_selected(value):
	match value:
		0:
			#RESTART
			get_tree().change_scene("res://Levels/Level1.tscn")
			
		1:
			#QUIT
			get_tree().quit()
