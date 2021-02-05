extends Area2D
class_name Enemy

signal enemy_dead()
signal enemy_escaped()
signal enemy_crashed()

var bullet = preload("res://entities/bullet/Bullet.tscn")

onready var shoot_cooldown = $FireRateTimer
onready var shooting_point = $ShootingPoint

var speed

var sprite setget set_sprite
var fire_rate setget set_fire_rate

func _ready():
	shoot()

func set_sprite(value):
	sprite = value
	$Sprite.texture = value
	
func set_fire_rate(value):
	fire_rate = value
	$FireRateTimer.wait_time = value

func _physics_process(delta):
		
	# MOVEMENT TO THE LEFT
	global_position.y += speed
	if global_position.y == 720:
		emit_signal("enemy_escaped")
		destroy()

func shoot():
	shoot_cooldown.start()
	
	# SHOOT PROJECTILE
	var new_bullet = bullet.instance()
	new_bullet.direction = Vector2.DOWN
	new_bullet.global_position = shooting_point.global_position
	get_tree().current_scene.add_child(new_bullet)

func _on_Enemy_body_shape_entered(body_id, body, body_shape, area_shape):
	# LE JOUEUR PERCUTE L'ENNEMI
	emit_signal("enemy_crashed")
	destroy()
	
func _on_Enemy_area_shape_entered(area_id, area, area_shape, self_shape):
	
	if area is Bullet:
		#UNE BALLE DU JOUEUR TOUCHE L'ENNEMI / MORT
		emit_signal("enemy_dead")
	
	destroy()
	
func destroy():
	queue_free()


func _on_FireRateTimer_timeout():
	shoot()
