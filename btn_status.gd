extends Button

func _pressed():
	get_node("/root/world").find_node("PopupPanel_status").visible = !get_node("/root/world").find_node("PopupPanel_status").visible