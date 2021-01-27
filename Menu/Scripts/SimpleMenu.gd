extends Node2D
class_name SimpleMenu

var items = []
var cur_item = 0

export var SELECTED_ITEM_OPACITY = 1.0
export var UNSELECTED_ITEM_OPACITY = 0.3
export var UNSELECTABLE_ITEM_OPACITY = 0.1

signal selected_item

# Called when the node enters the scene tree for the first time.
func _ready():
	update_menu()
	
func update_menu():
	items = []
	for c in get_children():
		if c is SimpleMenuItem:
			print("ototo")
			if c.selectable:
				items.append( c )
				c.modulate.a = UNSELECTED_ITEM_OPACITY
			else:
				c.modulate.a = UNSELECTABLE_ITEM_OPACITY
	items[cur_item].modulate.a = SELECTED_ITEM_OPACITY


func set_item():
	for idx in range( items.size() ):
		if cur_item == idx:
			items[idx].modulate.a = SELECTED_ITEM_OPACITY
		else:
			items[idx].modulate.a = UNSELECTED_ITEM_OPACITY

func _input(event):
	if event.is_action_pressed("ui_up"):
		cur_item -= 1
		if cur_item < 0: cur_item += items.size()
		set_item()
		#le truc précdéent
		pass
	elif event.is_action_pressed("ui_down"):
		cur_item += 1
		if cur_item >= items.size(): cur_item -= items.size()
		set_item()
		pass
	if event.is_action_pressed( "ui_select"):
		_on_item_selected(cur_item)
		emit_signal( "selected_item", cur_item )


func _on_item_selected(value):
	pass

func _on_StartBtn_pressed():
	get_tree().change_scene("res://Menu/LevelSelectionMenu/LevelSelectionMenu.tscn")
	pass # Replace with function body.
