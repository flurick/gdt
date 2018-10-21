extends Control

func _ready():
	$overlay.visible = true
	$overlay.modulate.a = 1

func _process(delta):
	$overlay.modulate.a = lerp($overlay.modulate.a , 0,0.01)
	if $overlay.modulate.a < 0.1: 
		$overlay.modulate.a = 0
		set_process(false)