extends SimpleMenu

func _ready():
	no_back = true
	
	# IL PEUT CONTINUER A FONCTIONNER DURANT LA POSE
	pause_mode = Node.PAUSE_MODE_PROCESS


func _input(event):
	if event.is_action_pressed( "pause"):
		Game.main.toggle_pause()

func _on_item_selected(value):
	._on_item_selected(value)
	
	match value:

		0:
			
			Game.main.toggle_pause()
			
		1:
			#QUITTER
			get_tree().quit()
