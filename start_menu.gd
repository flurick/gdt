extends MenuButton

signal open(path)


func _ready():
	get_popup().connect("id_pressed",self,"id_pressed")
	for file in global.ls("res://Apps").files:
		if file.match("*app.tscn"):
			get_popup().add_item(file)


func id_pressed(id):
	emit_signal("open", get_popup().get_item_text(id))