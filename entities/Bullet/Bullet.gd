extends Area2D
class_name Bullet

var SPEED = 10
var direction : Vector2

func _physics_process(delta):
	global_position += direction.normalized() * SPEED

func _on_Bullet_body_entered(body):
	#DETECTER SI C'EST UNE SORTIE
	if body.name == "Player":
		#LE JOUEUR EST TOUCHE PAR UNE BALLE MAIS PAS DE DOMAGE SPECIFIQUE SUR ELLE MEME
		#ELLE RETIRE JUSTE UNE VIE AU JOUEUR
		LevelManager.hit_player()
	elif body is Area2D:
		queue_free()
