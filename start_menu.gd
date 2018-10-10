extends MenuButton



func _ready():
	
	get_popup().connect("id_pressed",self,"id_pressed")
	
	for window in get_node("/root/world").get_children():
		if window is WindowDialog:
			get_popup().add_item(window.name)


func id_pressed(id):
	get_node("/root/world").get_node( get_popup().get_item_text(id) ).show()