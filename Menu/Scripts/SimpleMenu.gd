extends CanvasLayer
class_name SimpleMenu

var items = []
var cur_item = 0

export var SELECTED_ITEM_OPACITY = 1.0
export var UNSELECTED_ITEM_OPACITY = 0.3
export var UNSELECTABLE_ITEM_OPACITY = 0.1

var dead_zone = 0.99

signal selected_item

func _ready():
	update_menu()
	
func update_menu():
	items = []
	for c in get_children():
		if c is SimpleMenuItem:
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
	if event.get_action_strength( "ui_up") > dead_zone and !event.is_echo():
		cur_item -= 1
		if cur_item < 0: cur_item += items.size()
		set_item()
		pass
		
	if event.get_action_strength( "ui_down") > dead_zone and !event.is_echo():
		cur_item += 1
		if cur_item >= items.size(): cur_item -= items.size()
		set_item()
		pass
		
	if event.is_action_pressed( "ui_accept"):
		_on_item_selected(cur_item)
		emit_signal( "selected_item", cur_item )
	
#	if event.is_action_pressed("ui_up"):
#		cur_item -= 1
#		if cur_item < 0: cur_item += items.size()
#		set_item()
#		pass
#
#	elif event.is_action_pressed("ui_down", false):
#		cur_item += 1
#		if cur_item >= items.size(): cur_item -= items.size()
#		set_item()
#		pass

func _on_item_selected(value):
	pass
