extends Control

func _ready():
	var file = File.new()
	file.open("good_stuff", file.READ)
	$TextEdit.text = str(file.get_var())



func _on_TextEdit_text_changed():
	var file = File.new()
	file.open("good_stuff", file.WRITE)
	file.store_var($TextEdit.text)
	
	ResourceSaver.save("good_stuff_to", $TextEdit.text)