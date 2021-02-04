extends Resource
class_name Wave
export(Array, Resource) var enemies

#export(Resource) var enemy_type
#export(int) var number_of_enemies

func _init(p_enemies = []):
#	enemy_type = p_enemy_type
#	number_of_enemies = p_number_of_enemies
	enemies = p_enemies
