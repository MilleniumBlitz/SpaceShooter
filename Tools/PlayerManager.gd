extends Node

signal fire_rate_changed(value)

signal player_dead()
signal health_changed(value)
signal max_health_changed(value)

var health setget set_health
var max_health 

func _ready():
	PlayerManager.connect("player_dead", LevelManager, "player_dead")

func set_health(value):
	health = value
	if health == 0:
		
		#LE JOUEUR EST MORT, DEFAITE
		emit_signal("player_dead")
#		game_over(false)
	elif health > 0:
		#LE JOUEUR EST TOUCHE
		emit_signal("health_changed", health)

func set_max_health(value):
	max_health = value
	emit_signal("max_health_changed", max_health)
	
func hit_player():
	set_health(health - 1)

func x2_fire_rate():
	emit_signal("fire_rate_changed", 0.075)
