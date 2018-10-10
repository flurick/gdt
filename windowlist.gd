extends VBoxContainer

func _ready():
	pass


func _on_Paint_toggled(button_pressed):
	get_node("/root/world/Paint").visible = button_pressed
