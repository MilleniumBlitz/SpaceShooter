extends Resource
class_name Wave

export(PackedScene) var ennemy_type
export(int) var number_of_ennemies

func _init(p_ennemy_type = "res://entities/enemy/Enemy.tscn", p_number_of_ennemies = 0):
	ennemy_type = p_ennemy_type
	number_of_ennemies = p_number_of_ennemies
