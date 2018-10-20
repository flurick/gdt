extends ItemList

var selection_start = 0
var selection_end = 0
var held = {"l":false, "r":false, "m":false}




func select_all():
	for i in range(0,get_item_count()):
		select(i, false)


func select_none():
	unselect_all()


func select_invert():
	for i in range(0,get_item_count()):
		if is_selected(i):  unselect(i)
		else:  select(i,false)


func select_range(start,end):
	select_none()
	var a = min(start,end)
	var b = max(start,end)
	for i in range(a,b):
		select(i, false)



func _gui_input(event):
	
	if event is InputEventKey:
		if event.control and event.pressed:
			match event.scancode:
				KEY_A: select_all()
				KEY_D: select_none()
				KEY_I: select_invert()
	
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_LEFT: 
				held.l = event.pressed
				if event.pressed:
					if event.shift:
						select(selection_start) #move end point of with shift-click
#						if event.doubleclick:
#							unselect_all()
#							for i in range(0,get_item_count()):
#								select(i)
					else:
						selection_start = get_item_at_position(event.position)
						emit_signal("item_selected", get_item_at_position(event.position) )
				else:
					selection_end = get_item_at_position(event.position)
			BUTTON_RIGHT: 
				held.r = event.pressed
				select( get_item_at_position(event.position) )
				emit_signal("item_selected", get_item_at_position(event.position) )
			BUTTON_MIDDLE: 
				held.m = event.pressed
#				if event.pressed:
#					pass 
#				else:
#					unselect( get_item_at_position(event.position) ) 
#
	if event is InputEventMouseMotion:
		if held.l:  
			selection_end = get_item_at_position(event.position)
			select_range(selection_start, selection_end)
#			select( get_item_at_position(event.position), false )
		if held.r:  
			select( get_item_at_position(event.position) )
			emit_signal("item_selected", get_item_at_position(event.position) )
		if held.m:  unselect( get_item_at_position(event.position) )



func index_at_position(pos):
	if get_item_at_position(pos):
		return get_item_at_position(pos)
	return 0

