extends Button

export var target_window = ""

func _ready():
	connect("toggled",self,"toggle")

func toggle(arg):
	print(target_window, get_node(target_window), arg)
	if arg:
		get_node(target_window).show()
	else:
		get_node(target_window).hide()

func change():
	if get_node(target_window):
		pressed = !get_node(target_window).visible