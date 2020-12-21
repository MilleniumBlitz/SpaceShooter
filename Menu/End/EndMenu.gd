extends CenterContainer

#RESTART THE LEVEL
func _on_RestartBtn_pressed():
	get_tree().reload_current_scene()

#GO TO THE SELECTION MENU
func _on_SelectionBtn_pressed():
	get_tree().change_scene("res://Menu/LevelSelectionMenu/LevelSelectionMenu.tscn")

#CLOSE THE GAME
func _on_LeaveBtn_pressed():
	get_tree().quit()


