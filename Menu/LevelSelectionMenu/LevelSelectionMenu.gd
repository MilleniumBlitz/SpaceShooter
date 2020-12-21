extends Control

const levels_path = "res://Levels/"

onready var level_btn = preload("res://Menu/LevelBtn.tscn")

func _ready():
	
	var dir = Directory.new()
	if dir.open(levels_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		while file_name != "":
			file_name = dir.get_next()
			if !dir.current_is_dir():
				if file_name.ends_with(".tscn"):
					var new_level_btn = Button.new()
					new_level_btn.text = "LEVEL"
					new_level_btn.connect("pressed", self, "load_level", [file_name])
#					$VBoxContainer.add_child(new_level_btn)
	else:
		print("An error occurred when trying to access the path.")
	

func load_level(file_name):
	
	# LOAD SPECIFIC LEVEL
	var level_path = levels_path + file_name
	get_tree().change_scene(level_path)
