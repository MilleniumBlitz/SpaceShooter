extends Node
	
func enemy_dead():
	pass
	# UN ENNEMI MEURT
	# AJOUTER AU SCORE ????

func enemy_escaped():
	
	enemy_dead()
	PlayerManager.hit_player()

func enemy_crashed():
	
	enemy_dead()
	PlayerManager.hit_player()

func restart():
	Game.main.load_main_level()
