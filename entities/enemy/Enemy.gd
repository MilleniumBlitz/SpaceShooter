extends Area2D
class_name Ennemy

signal enemy_dead()
signal enemy_escaped()
signal enemy_crashed()

var bullet = preload("res://entities/Bullet/Bullet.tscn")

onready var shoot_cooldown = $FireRateTimer

var speed = 2

func _physics_process(delta):
	
	if shoot_cooldown.is_stopped():
		shoot_cooldown.start()

		# SHOOT PROJECTILE
		var new_bullet = bullet.instance()
		new_bullet.direction = Vector2.LEFT
		new_bullet.global_position = $ShootingPoint.global_position
		get_tree().current_scene.add_child(new_bullet)
	
	# MOVEMENT TO THE LEFT
	global_position.x -= speed

func _on_Enemy_body_shape_entered(body_id, body, body_shape, area_shape):
	
	# LE JOUEUR PERCUTE L'ENNEMI
	emit_signal("enemy_crashed")
	destroy()
	
func _on_Enemy_area_shape_entered(area_id, area, area_shape, self_shape):
	
	if area is Bullet:		
		#UNE BALLE DU JOUEUR TOUCHE L'ENNEMI / MORT
		emit_signal("enemy_dead")
		destroy()

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("enemy_escaped")
	destroy()
	
func destroy():
	$VisibilityNotifier2D.disconnect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")
	queue_free()
