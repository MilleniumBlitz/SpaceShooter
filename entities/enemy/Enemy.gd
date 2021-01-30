extends Area2D
class_name Ennemy

export(float) var speed = 200

export(float) var fire_rate = 0.4
onready var shoot_cooldown = $FireRateTimer

var bullet = preload("res://bullet.tscn")

signal enemy_dead

func _physics_process(delta):
	
	if shoot_cooldown.is_stopped():
		shoot_cooldown.start(fire_rate)

		# SHOOT PROJECTILE
		var new_bullet = bullet.instance()
		new_bullet.direction = Vector2.LEFT
		new_bullet.global_position = $ShootingPoint.global_position
		get_tree().current_scene.add_child(new_bullet)
	
	# MOVEMENT TO THE LEFT
	global_position.x -= speed


func _on_Enemy_body_shape_entered(body_id, body, body_shape, area_shape):
	
	# LE JOUEUR PERCUTE L'ENNEMI
	print("percute")
	queue_free()
	
func _on_Enemy_area_shape_entered(area_id, area, area_shape, self_shape):
	
	# A PLAYER BULLET HIT THE ENEMY
	queue_free()
	emit_signal("enemy_dead", get_tree().get_root())
