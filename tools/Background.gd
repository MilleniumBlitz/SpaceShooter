extends TextureRect

var is_paused = false

func set_pause(value):
	is_paused = value
#	if is_paused:
#		material.set_shader_param('scroll_speed', 0)
#	else:
#		material.set_shader_param('scroll_speed', 0.5)
