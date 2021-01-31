extends Area2D
class_name Bullet

var SPEED = 20
var direction : Vector2

func _physics_process(delta):
	global_position += direction.normalized() * SPEED

func _on_bullet_body_entered(body):
	
	#LE JOUEUR EST TOUCHE PAR UNE BALLE MAIS PAS DE DOMAGE SPECIFIQUE SUR ELLE MEME
	#ELLE RETIRE JUSTE UNE VIE AU JOUEUR
	LevelManager.hit_player()
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
