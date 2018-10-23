#DialogueBoxs.gd
extends RichTextLabel

var dialog = ["Hello and goodbye.", "HELLO, GOODBYE!", "Now I say goodbye and you say hello."]
var page = 0

var isDone = false

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)


func _input(event):
	
	if event is InputEventMouseButton and event.pressed:
		
		if isDone:
			if page < dialog.size()-1:
				page += 1
				bbcode_text = dialog[page]
				visible_characters = 0
				isDone = false
		else:
			visible_characters = get_total_character_count()
			isDone = true


func _on_Timer_timeout():
	
	$Label.text = str(isDone, " ", visible_characters, "/", get_total_character_count())
	
	print(isDone, visible_characters)
	if visible_characters < get_total_character_count():
		visible_characters += 1
		if visible_characters == get_total_character_count():
			isDone = true