extends SimpleMenu

func _ready():
	get_tree().paused = false

#var selected_level
func _on_item_selected(value):
	._on_item_selected(value)
	
	self.set_process_input(false)
	Game.main.load_main_level()
	
#	match value:
#		0:
#			selected_level = 1
#		1:
#			selected_level = 2
