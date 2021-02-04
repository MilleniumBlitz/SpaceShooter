extends KinematicBody2D

const SPEED = 5

var motion = Vector2()
var input_direction = Vector2()

onready var shoot_cooldown = $FireRateTimer
onready var left_shooting_point = $LeftShooting
onready var right_shooting_point = $RightShooting

var bullet = preload("res://entities/bullet/Bullet.tscn")

func _input(event):
	pass
#	input_direction = Vector2(event.get_action_strength("move_right")) - event.get_action_strength("move_left")),
#				event.get_action_strength("move_down")) - event.get_action_strength("move_up")))
#	prevent.get_action_strength("move_right"))

func _physics_process(delta):

	if Input.is_action_pressed("shoot")  and shoot_cooldown.is_stopped() and LevelManager.level_started:
		shoot_cooldown.start()

		#LEFT BULLET
		var left_bullet = bullet.instance()	
		left_bullet.direction = Vector2.UP
		left_bullet.global_position = left_shooting_point.global_position
		get_tree().current_scene.add_child(left_bullet)

		#RIGHT BULLET
#		var right_bullet = bullet.instance()
#		right_bullet.direction = Vector2.UP
#		right_bullet.global_position = right_shooting_point.global_position
#		get_tree().current_scene.add_child(right_bullet)

	#DIRECTION
	input_direction = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
				Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
				
	
				
	global_position +=  input_direction.normalized() * SPEED
	global_position.x = clamp(global_position.x, 0, 480)
	global_position.y = clamp(global_position.y, 0, 720)
	
