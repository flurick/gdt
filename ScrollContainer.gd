extends Control


var M = get_rect().size*0.5 #the Middle/center of this scrollbox control
var v = Vector2(0,0) #current scrolling velecity
var r = 0 #rotaional veclocity
var just_stop_under = 1
var multi = -4 #speed of one scroll "click"
var is_grabbed = false
var is_grabbed_for_rotation = false
export var debug = false

func _process(delta):
	v *= 0.9
	if v.length() <= just_stop_under: v = Vector2(0,0)
	$origin.rect_position += v
	
	r *= 0.99
	$origin.rect_rotation += r
	
#	update()
#
#
#func _draw():
#	if debug: draw_line( M, M+$origin.rect_position, Color(1,0,1), 1)


func _gui_input(event):
	
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_MIDDLE:	is_grabbed = event.pressed
			BUTTON_RIGHT:	is_grabbed_for_rotation = event.pressed
	
	if event is InputEventMouseMotion:
		if is_grabbed:	v = event.relative
		if is_grabbed_for_rotation:
			if event.position.x > M.x: 
				r += event.relative.y * 0.01
			else: 
				r -= event.relative.y * 0.01
			if event.position.y > M.y: 
				r -= event.relative.x * 0.01
			else: 
				r += event.relative.x * 0.01
	
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_WHEEL_DOWN:	v.y += multi
			BUTTON_WHEEL_UP: 	v.y -= multi
			BUTTON_WHEEL_RIGHT:	v.x += multi
			BUTTON_WHEEL_LEFT:	v.x -= multi