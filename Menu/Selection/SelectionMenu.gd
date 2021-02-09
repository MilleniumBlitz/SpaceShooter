extends SimpleMenu

var selected_level

func _on_item_selected(value):
	._on_item_selected(value)
	
	match value:
		0:
			selected_level = 1
		1:
			selected_level = 2

	#INTRO FONDU
	var tween = $IntroTween
	tween.interpolate_property($ColorRect, "color:a", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	tween.start()

func _on_IntroTween_tween_completed(object, key):
#	call_deferred("queue_free")
	LevelManager.start_level(selected_level)
