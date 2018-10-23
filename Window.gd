extends Control

var held = {"l":false, "r":false, "m":false}
var grid = Vector2(100,100)
signal req_show_on_top (window)

var title = "App" setget set_title
func set_title(arg):
	title = arg
	find_node("title").text = arg

func toggle_visible():
	visible = !visible

func _ready():
	rect_min_size = grid
#	$V/header.rect_min_size = grid
	
	find_node("close").connect("pressed", self, "close")


var corner = false
func corner(event):
	
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_LEFT:  corner = event.pressed

	if event is InputEventMouseMotion:
		if corner:  rect_size += event.relative

func close():
	visible = false


func _gui_input(event):
	
	
	#pressed
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			BUTTON_LEFT:  emit_signal("req_show_on_top", self)
			BUTTON_MIDDLE:  pass
			BUTTON_RIGHT:  pass
		
	#held
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_LEFT:  held.l = event.pressed
			BUTTON_MIDDLE:  held.m = event.pressed
			BUTTON_RIGHT:  held.r = event.pressed
	
	#drag
	if event is InputEventMouseMotion:
		if held.l:  rect_position += event.relative
		if held.m:  pass
		if held.r:  rect_size += event.relative
	
	#release
	if event is InputEventMouseButton and not event.pressed:
		match event.button_index:
			BUTTON_LEFT:  if event.control: rect_position = rect_position.snapped(grid)
			BUTTON_MIDDLE:  pass
			BUTTON_RIGHT:  if event.control: rect_size = rect_size.snapped(grid)

