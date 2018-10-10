extends WindowDialog

export var minibutton = ""
func _ready():
#	connect("tree_entered",self,"move_to_top")
#	connect("hide",self,"minmax")
	connect("visibility_changed",self,"move_to_top")

func minmax():
	if get_node(minibutton) and get_node(minibutton) is Button:
		get_node(minibutton).pressed = false

func _gui_input(event):
	if event is InputEventMouseButton:
		move_to_top()

func move_to_top():
	get_parent().move_child(self, get_parent().get_child_count())