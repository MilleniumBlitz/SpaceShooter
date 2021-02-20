extends Area2D
class_name Bullet

var SPEED = 10
var direction : Vector2

func _physics_process(delta):
	global_position += direction.normalized() * SPEED

func _on_Bullet_body_entered(body):
	
	if body.name == "Player":
		
		# LE JOUEUR EST TOUCHE PAR UNE BALLE / RETIRE UNE VIE AU JOUEUR
		body.hit()
		
	elif body is Area2D:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
