extends KinematicBody2D
class_name Player

const ACCELERATION = 200
const MAX_SPEED = 1000
var motion = Vector2()

onready var shoot_cooldown = $FireRateTimer
onready var shooting_point = $ShootingPoint

onready var hit_cooldown = $HitTimer

var bullet = preload("res://entities/bullet/Bullet.tscn")

var default_speed = Vector2(0, 0.5)

var t = 0.0

func _ready():
	PlayerManager.connect("fire_rate_changed", self, "change_fire_rate")

func change_fire_rate(value):
	shoot_cooldown.wait_time = value

func _physics_process(delta):
	motion = Vector2.ZERO
	t += delta * 0.4
	
	# SHOOT / SPAWN BULLET
	if Input.is_action_pressed("shoot") and shoot_cooldown.is_stopped():
		shoot_cooldown.start()
		
		# PROJECTILE
		var left_bullet = bullet.instance()
		left_bullet.direction = Vector2.UP
		left_bullet.global_position = shooting_point.global_position
		get_tree().current_scene.add_child(left_bullet)
		
		# SON
		$Shoot.play()
		
	# DIRECTION
	var input_direction = get_input_direction()
	
	if input_direction != Vector2.ZERO:
		motion += input_direction * ACCELERATION * delta
		motion = motion.clamped(MAX_SPEED * delta)
	else:
		motion = Vector2.ZERO
		
	move_and_collide(motion * delta)
	
	# LIMITE DE L'ECRAN
	global_position.x = clamp(global_position.x, 0, 480)
	global_position.y = clamp(global_position.y, 0, 720)
	if global_position.y == 720 and hit_cooldown.is_stopped():
		hit()

func get_input_direction():
	
	var input_direction = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
	return input_direction.normalized()

func hit():
	hit_cooldown.start()
	PlayerManager.hit_player()
	$AnimationPlayer.play("hit_flash")
	print("hit")
