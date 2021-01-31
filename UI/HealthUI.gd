extends Control

onready var health_bar_empty = preload("res://sprite/UI/HealthBar/health_empty.png")
onready var health_bar_full = preload("res://sprite/UI/HealthBar/health_full.png")

func _ready():
	
	#CREATION D'UN NOUVEL EMPLACEMENT DE VIE / ICI LA MAX HEALTH (LE 3 dans range)
	var position = Vector2(30,30)
	for i in range(3):
		
		var health_view = Sprite.new()
		health_view.name = "HealthBar" + str(i)
		health_view.texture = health_bar_full
		health_view.position = position
		add_child(health_view)
		
		position.x += 16
	
	#CONNEXION AU MANAGER DE NIVEAU
#	LevelManager.connect("health_changed", self, "set_health")
	
func player_hit(health):
	var toto = get_child(health)
	toto.texture = health_bar_empty
