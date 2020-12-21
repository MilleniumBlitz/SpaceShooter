extends Area2D

export var SPEED = 400

var direction : Vector2

func _physics_process(delta):
	global_position += direction * SPEED * delta
