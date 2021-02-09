extends SimpleMenu


signal menu_closed()

func _ready():
	no_back = true
	
	# IL PEUT CONTINUER A FONCTIONNER DURANT LA POSE
	pause_mode = Node.PAUSE_MODE_PROCESS

func _input(event):
	
	#REPRENDRE
	if event.is_action_pressed( "ui_cancel"):
		emit_signal("menu_closed")

func _on_item_selected(value):
	._on_item_selected(value)
	match value:


		1:
			MenuManager.previous_menu = null
			get_tree().change_scene("res://menu/selection/SelectionMenu.tscn")
		2:
			#QUITTER
			get_tree().quit()
			
	emit_signal("menu_closed")
			
	
