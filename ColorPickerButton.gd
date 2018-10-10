extends ColorPickerButton

func _on_ColorPickerButton_color_changed(color):
	get_node("/root/world/bg").modulate = color
