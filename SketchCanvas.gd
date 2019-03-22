extends Control


var line
var active = false

class dab:
	var pos
	var size
	var color

class stroke:
	var points = []

class layer:
	var strokes = []
	var opacity = 1.0


var brush = dab.new()


func _ready():
	randomize()
	brush.size = 30*randf()
	brush.color = Color(randf(),randf(),randf())
	
	$"../Time".connect("done",self,"reset")


func reset():
	for child in get_children():
		remove_child(child)


func _gui_input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT: 
			accept_event()
			active = event.pressed
			
			
			
			line = Line2D.new()
			line.width = brush.size
			line.begin_cap_mode = Line2D.LINE_CAP_ROUND
			line.end_cap_mode = Line2D.LINE_CAP_ROUND
			line.joint_mode = Line2D.LINE_JOINT_ROUND
			line.default_color = brush.color
			line.add_point( get_global_mouse_position() )
			line.add_point( get_global_mouse_position()+Vector2(0,1) )
			add_child(line)
	
	if event is InputEventMouseMotion:
		if active:
			line.add_point( get_global_mouse_position() )
		
		update()

func _draw():
	draw_circle( get_global_mouse_position(), brush.size, brush.color.linear_interpolate( Color(0,0,0, 0.8), 0.5) )
	


