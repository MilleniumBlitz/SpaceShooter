extends Area2D

export var SPEED = 1
var direction : Vector2

func _physics_process(delta):
	global_position += direction.normalized() * SPEED


func _on_bullet_body_entered(body):
	
	#LE JOUEUR EST TOUCHE PAR UNE BALLE MAIS PAS DE DOMAGE SPECIFIQUE SUR ELLE MEME
	#ELLE RETIRE JUSTE UNE VIE AU JOUEUR
	print("oui ça touche le joueur")
#	var bullet_damage = 1
	LevelManager.hit_player()
#	LevelManager.player_health -= bullet_damage
