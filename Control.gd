tool
extends Control


var mark = 0
var mark_limit = {"start":0,"end":16}

var width = 6
var padding = 2
var zoom = 4

export (Color) var fg = ColorN("tomato")
export (Color) var bg = ColorN("gray")

var track = {}
var input = [KEY_Q,KEY_W,KEY_E,KEY_R,KEY_T,KEY_Y,KEY_U,KEY_I,KEY_O,KEY_P]


func _input(event):
	
	if event is InputEventKey:
		
		if event.pressed and input.find(event.scancode) != -1:
			track[mark+1] = input.find(event.scancode)



func _on_Timer_timeout():
	
	mark += 1
	if mark > mark_limit.end:  mark = mark_limit.start
	
	if not track.has(mark):  track[mark] = false
		
	if track[mark]:
		$AudioStreamPlayer.play()
		
	if Input.is_key_pressed(KEY_DELETE): 
		track[mark] = false
	
	update()


func draw_entry(start, end, color=fg):
	draw_circle( Vector2(0,start), (width+padding)*0.5, color)
	draw_line( Vector2(0,start), Vector2(0,end), color, width+padding)
	draw_circle( Vector2(0,end), (width+padding)*0.5, color)


func _draw():
	
	draw_entry(mark_limit.start*zoom, (mark_limit.end-1)*zoom, bg)
	
	for note in track:
		if track[note]:
			draw_line(Vector2(0,note*zoom), Vector2(0,(note-1)*zoom), fg, width)
	
	draw_line(Vector2(0,mark*zoom), Vector2(0,(mark+1)*zoom), fg, width*2)
	draw_line(Vector2(0,mark*zoom), Vector2(0,(mark-1)*zoom), bg, width*2)





func _on_VSlider_value_changed(value):
	$Timer.wait_time = value


func _on_OptionButton_item_selected(ID):
	$AudioStreamPlayer.bus = $bus.get_item_text(ID)
