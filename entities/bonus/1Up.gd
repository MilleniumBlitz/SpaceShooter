extends Bonus

func _on_hit():
	LevelManager.add_life()
