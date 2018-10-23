extends Control


func move_window_to_top(window):
	move_child(window, get_child_count())


func open(app_tscn):
	
	var w = load("res://Window.tscn").instance()
	w.connect("req_show_on_top", self, "move_window_to_top")
	add_child(w)
	if load(app_tscn):
		var app = load(app_tscn).instance()
		app.margin_top = 40
		w.add_child(app)
		w.title = app_tscn
	else:
		print("fail: ",app_tscn)
#		var l = Label.new()
#		l.text = app_tscn
#		w.add_child(l)
	
	print( rect_size )
	w.rect_position = rect_size*0.5 #Vector2(500,500)#
	
	var dock_icon = Button.new() 
	dock_icon.connect("pressed", w, "toggle_visible")
	dock_icon.text = app_tscn
	$dock/windowlist.add_child(dock_icon)
	
	return w


func _ready():
	open("Configure.app.tscn")
	open("Archive.app.tscn")


func _on_start_menu_open(path):
	open(path)