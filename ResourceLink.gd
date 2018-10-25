extends Node

export var target_path = ""
#export var png_name = ""

func _on_TextureRect_texture_changed():
	print( get_node(target_path) )
	get_node(target_path).texture = get_parent().texture
#	get_parent().texture.save_png(png_name)
