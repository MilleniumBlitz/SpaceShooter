extends Resource
class_name Wave

export(Resource) var enemy_type
export(int) var number_of_enemies

func _init(p_enemy_type = "", p_number_of_enemies = 0):
	enemy_type = p_enemy_type
	number_of_enemies = p_number_of_enemies
