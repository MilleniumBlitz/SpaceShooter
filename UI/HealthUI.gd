extends Control


onready var health_bar_empty = preload("res://sprite/UI/HealthBar/health_empty.png")
onready var health_bar_full = preload("res://sprite/UI/HealthBar/health_full.png")

var lives setget set_lives
var max_lives setget set_max_lives

func _ready():
	lives = PlayerManager.health
	max_lives = PlayerManager.max_health
	
	create_slots()

# CREATION DES SLOTS DE VIES
func create_slots():
	
	for child in get_children():
		remove_child(child)
	
	var position = Vector2(30,30)
	for i in range(max_lives):
		
		var health_view = Sprite.new()
		health_view.name = "HealthBar" + str(i)
		health_view.position = position
		health_view.texture = health_bar_empty
			
		add_child(health_view)		
		position.x += 16
		
	for i in range(lives):
		var live_slot = get_child(i)
		if live_slot:
			live_slot.texture = health_bar_full
			
func set_lives(value):
	lives = value
	
	for i in range(lives, max_lives):
		var live_slot = get_child(i)
		if live_slot:
			live_slot.texture = health_bar_empty 
			
func update_display():
	for child in get_children():
		child.texture = health_bar_empty
		
	for i in range(lives):
		var live_slot = get_child(i)
		if live_slot:
			live_slot.texture = health_bar_full
			
	
func set_max_lives(value):
	max_lives = value
	create_slots()
