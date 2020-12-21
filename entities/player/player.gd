extends KinematicBody2D

const SPEED = 200

var motion = Vector2()
var input_direction = Vector2()

export(float) var fire_rate = 0.4
onready var shoot_cooldown = $FireRateTimer
onready var left_shooting_point = $LeftShooting
onready var right_shooting_point = $RightShooting

var bullet = preload("res://bullet.tscn")

func _physics_process(delta):

	if Input.is_action_pressed("shoot") and shoot_cooldown.is_stopped():
		shoot_cooldown.start(fire_rate)

		var left_bullet = bullet.instance()	
		left_bullet.direction = Vector2.RIGHT
		get_tree().current_scene.add_child(left_bullet)
		left_bullet.global_position = left_shooting_point.global_position
		
		var right_bullet = bullet.instance()
		right_bullet.direction = Vector2.RIGHT
		get_tree().current_scene.add_child(right_bullet)
		right_bullet.global_position = right_shooting_point.global_position

	input_direction = Vector2(int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
				int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")))
				
	global_position +=  input_direction.normalized() * SPEED * delta
