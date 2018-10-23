extends TextureRect


var img = Image.new()
var itex = ImageTexture.new()
export var fg = Color(1,1,1)
export var bg = Color(0,0,0)
export var bg_source = ""
export var random_colors = false
var png = "desktop.png"


signal texture_changed


func _ready():
	print("load ", png, ": ", img.load(png))
#	img.create(rect_size.x, rect_size.y, 0, Image.FORMAT_RGB8)
	randomize()
	if random_colors: bg = Color(randf(),randf(),randf())
	if random_colors: fg = Color(randf(),randf(),randf())
#	img.fill(bg)
	itex.create_from_image(img)
	itex.flags = 0
	texture = itex
	
	rect_scale.x = get_parent().rect_size.x / img.get_size().x
	rect_scale.y = rect_scale.x
	
	get_node("../Label").text = png

#	if get_node(target):
#		get_node(target).texture = texture


var is_drawing = false
var mode = 0
func _gui_input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT: accept_event()
		mode = event.button_index
		is_drawing = event.pressed
		edit(event)
	
	if event is InputEventMouseMotion \
	and is_drawing:
		edit(event)

#export var target = ""
func edit(event):

	img.lock()
	if mode == BUTTON_LEFT:   img.set_pixel(event.position.x, event.position.y, fg)
	if mode == BUTTON_RIGHT:  img.set_pixel(event.position.x, event.position.y, bg)
	img.unlock()
	itex.create_from_image(img)
	itex.flags = 0
	texture = itex
	
	emit_signal("texture_changed")

#	if get_node(target):
#		get_node(target).texture = texture
	
#	img.save_png("desktop.png")
	


func _on_ColorPickerButton_color_changed(color):
	fg = color


func _on_ColorPickerButton3_color_changed(color):
	bg =  color
