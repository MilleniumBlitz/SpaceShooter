extends SimpleMenu

func _ready():
	no_back = true

func _on_item_selected(value):
	._on_item_selected(value)
	match value:
		0:
			#RESTART
			LevelManager.restart()
			
		1:
			#QUIT
			get_tree().quit()
