extends Node2D

onready var end_menu = preload("res://Menu/End/EndMenu.tscn")

var over = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if over == false:
		if $Enemies.get_child_count() == 0:
			over = true
			$CenterContainer.visible = true
	pass


func _on_RestartBtn_pressed():
	get_tree().change_scene("res://Level1.tscn")


func _on_SelectionBtn_pressed():
	get_tree().change_scene("res://Menu/LevelSelectionMenu/LevelSelectionMenu.tscn")


func _on_LeaveBtn_pressed():
	get_tree().quit()
