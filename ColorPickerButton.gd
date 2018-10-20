extends ColorPickerButton
export var target = ""

func _on_ColorPickerButton_color_changed(color):
	if get_node(target):# and get_node(target).has_meta("modulate"):
		get_node(target).modulate = color
