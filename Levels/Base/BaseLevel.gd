extends Node2D

func _on_IntroTimer_timeout():
	LevelManager.level_started = true
	
	
	$EnemySpawner.waves = LevelManager.waves
	$EnemySpawner.start()
	LevelManager.connect("player_hit", $CanvasLayer/HealthUI, "player_hit")
