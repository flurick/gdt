extends TextureRect

func _ready():
	reload()

func reload():
	texture = load("desktop.png")
