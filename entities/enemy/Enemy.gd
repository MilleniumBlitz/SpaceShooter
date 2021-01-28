extends Area2D
class_name Ennemy

export(float) var speed = 200

export(float) var fire_rate = 0.4
onready var shoot_cooldown = $FireRateTimer

var bullet = preload("res://bullet.tscn")

func _physics_process(delta):
	
	if shoot_cooldown.is_stopped():
		shoot_cooldown.start(fire_rate)

		# SHOOT PROJECTILE
		var new_bullet = bullet.instance()
		new_bullet.direction = Vector2.LEFT
		new_bullet.global_position = $ShootingPoint.global_position
		get_tree().current_scene.add_child(new_bullet)
	
	# MOVEMENT TO THE LEFT
	global_position.x -= speed * delta


func _on_Enemy_body_shape_entered(body_id, body, body_shape, area_shape):
	queue_free()
	pass # Replace with function body.


func _on_Enemy_area_shape_entered(area_id, area, area_shape, self_shape):
	queue_free()
	pass # Replace with function body.
