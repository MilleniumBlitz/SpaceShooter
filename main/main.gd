extends Node2D
class_name Main

onready var levels = $Levels
onready var menus = $Menus

var current_level = null

var pause_menu = null

var playing = false

onready var Main_level = preload("res://levels/base/base_level.tscn")

func _enter_tree():
	
	init_stats()

func init_stats():
	
	# STATS DU JOUEUR
	PlayerManager.health = 10
	PlayerManager.max_health = 10

func _ready():
	
	Game.main = self
	
	# AFFICHAGE DE LA VIE DU JOUEUR
	PlayerManager.connect("health_changed", $HealthUI, "set_lives")
	PlayerManager.connect("max_health_changed", $HealthUI, "set_max_lives")
	PlayerManager.connect("player_dead", self, "game_over")
	
	load_menu("res://menu/start/start_menu.tscn")

func _input(event):

	# PAUSE
	if event.is_action_pressed("pause") and current_level:
		toggle_pause()

func load_menu(menu_path):
	
	for child in levels.get_children():
		levels.remove_child(child)
	
	for child in menus.get_children():
		child.queue_free()
		
	var new_menu =  load(menu_path).instance()
	menus.add_child(new_menu)

func load_main_level():
	
	init_stats()
	
	playing = true
	
	levels.visible = true
	
	# CHARGE LE NOUVEAU NIVEAU
	current_level =  Main_level.instance()
	
	#INTRO FONDU
	var tween = $IntroTween
	tween.connect("tween_completed", self, "_on_IntroTween_tween_completed")
	tween.interpolate_property($Intro/ColorRect, "color:a", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	tween.interpolate_property($TitleScreenMusic, "volume_db", 1, -80, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	tween.start()
	
func game_over():
	load_menu("res://menu/end/end_menu.tscn")

func toggle_pause():
	
	playing = !playing
	get_tree().paused = !playing
	set_process_input(playing)
	
	if playing:
		
		# REPRISE
		pause_menu.queue_free()
		menus.remove_child(pause_menu)
	else:

		# METTRE LE JEU PAUSE
		pause_menu =  load("res://menu/pause/pause_menu.tscn").instance()
		menus.add_child(pause_menu)
	
func _on_IntroTween_tween_completed(object, key):
	
	# ENLEVE L'ANCIEN NIVEAU
	for child in levels.get_children():
		levels.remove_child(child)

	# DESACTIVE L'INTERFACE
#	for child in menus.get_children():
#		menus.remove_child(child)

	for child in menus.get_children():
		child.call_deferred("queue_free")

#	$MainMusic.play()

#	#INTRO FONDU
	var tween = $IntroTween
	tween.disconnect("tween_completed", self, "_on_IntroTween_tween_completed")
	tween.interpolate_property($Intro/ColorRect, "color:a", 1, 0, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	tween.interpolate_property($MainMusic, "volume_db", -40, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	tween.start()

	levels.add_child(current_level)
	
func play_accept_sound():
	$AcceptMenuSFX.play()
