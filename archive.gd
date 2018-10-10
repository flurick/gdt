extends Control

var d
var debug = true

func _ready():
	lscol(find_node("bookmarks").get_item_text(0), "ls1")


func lscol(path, col):
	
	if debug: printt("lscol", str(path), str(col))
	var lst = ls(path)
	find_node(col).clear()
	for dir in lst.dirs:
		if path[-1] != "/": 
			path += "/"
		find_node(col).add_item(str(path,dir))
	for file in lst.files:
		find_node(col).add_item(str(path,file))


func ls(path):
	var dir = Directory.new()
	var dirs = []
	var files = []
	if dir.open(path) == OK:
		dir.list_dir_begin(true, true)
		var file_name = dir.get_next()
		while (file_name != ""):
			if dir.current_is_dir():
				dirs.append(file_name)
			else:
				files.append(file_name)
			file_name = dir.get_next()
	return {"path":path, "dirs":dirs, "files":files}



func _on_ls1_item_activated(index):
	var path = $HSplitContainer/HSplitContainer/miller/ls1.get_item_text(index)
	lscol(path, "ls2")
	find_node("ls3").clear()

func _on_ls2_item_activated(index):
	var path = $HSplitContainer/HSplitContainer/miller/ls2.get_item_text(index)
	lscol(path, "ls3")
