extends Control

export var flipped_h = false
export var flipped_v = false

func _ready():
	if flipped_h:
		$TextureRect.rect_scale.y *= -1
		$TextureRect.rect_position.y = $TextureRect.rect_size.y
	if flipped_v:
		$TextureRect.rect_scale.x = -1
		$TextureRect.rect_position.x = $TextureRect.rect_size.x