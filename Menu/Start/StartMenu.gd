extends SimpleMenu

func _on_item_selected(value):
	if value == 0:
		get_tree().change_scene("res://Levels/Level1.tscn")
		pass
	elif value == 1:
		get_tree().quit()
		#quitter
		pass
