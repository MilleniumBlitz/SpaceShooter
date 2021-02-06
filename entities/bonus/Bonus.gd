extends Area2D

var speed = 1

func _physics_process(delta):
	global_position.y += speed


func _on_Bonus_body_entered(body):
	if body is Player:
		on_hit()

func on_hit():
	LevelManager.add_life()
	queue_free()
