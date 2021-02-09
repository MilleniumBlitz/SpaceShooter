extends Area2D
class_name Bonus

var speed = 1

func _physics_process(delta):
	global_position.y += speed

func _on_Bonus_body_entered(body):
	if body is Player:
		_on_hit()

func _on_hit():
	queue_free()
