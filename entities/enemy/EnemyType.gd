extends Resource
class_name EnemyType

export(Texture) var sprite
export(int) var speed
export(float, 0.1, 10) var fire_rate

func _init(p_sprite = "", p_speed = 20, p_fire_rate = 0.5):
	sprite = p_sprite
	speed = p_speed
	fire_rate = p_fire_rate
