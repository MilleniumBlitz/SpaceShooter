extends Node2D

var pause = preload("res://menu/pause/PauseMenu.tscn")
var pause_menu

func _ready():
	
	#INTRO
	var tween = $IntroTween
	tween.interpolate_property($CanvasLayer/ColorRect, "color:a", 1, 0, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	tween.start()
	
	#MENU DE PAUSE
	pause_menu = pause.instance()
	pause_menu.connect("menu_closed", self, "on_pause_menu_closed")
	
	#JOUEUR
	PlayerManager.connect("health_changed", $CanvasLayer/HealthUI, "set_lives")
	PlayerManager.connect("max_health_changed", $CanvasLayer/HealthUI, "set_max_lives")


func _input(event):

	# PAUSE
	if event.is_action_pressed("pause") and !get_tree().paused:
		get_tree().paused = true
		set_process_input(false)
		add_child(pause_menu)
		set_process_input(false)
		Engine.time_scale = 0.0
			
func on_pause_menu_closed():
	
	get_tree().paused = false
	remove_child(pause_menu)
	set_process_input(true)
	Engine.time_scale = 1
	
func _on_IntroTimer_timeout():
	LevelManager.level_started = true
	
	$EnemySpawner.waves = LevelManager.waves
	$EnemySpawner.start()
#	LevelManager.connect("player_hit", $CanvasLayer/HealthUI, "player_hit")
	
