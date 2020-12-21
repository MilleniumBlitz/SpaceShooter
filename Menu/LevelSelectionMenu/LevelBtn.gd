extends Button


export(PackedScene) var level

func _on_LevelBtn_pressed():
	get_tree().change_scene_to(level)
