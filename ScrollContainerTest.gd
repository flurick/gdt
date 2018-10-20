extends ScrollContainer

func scroll_to_right():
	get_h_scrollbar().value = lerp(get_h_scrollbar().value, get_h_scrollbar().max_value, 0.02)
#	get_h_scrollbar().value = get_h_scrollbar().max_value
	
func scroll_to_bottom():
	get_v_scrollbar().value = lerp(get_v_scrollbar().value, get_v_scrollbar().max_value, 0.02)
#	get_v_scrollbar().value = get_v_scrollbar().max_value