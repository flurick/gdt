extends Control

var debug = true
var verbose = false
onready var miller = get_node("h/h/MillerColumns")




func _ready():
	lscol_dynamic(null, find_node("bookmarks").get_item_text(0))
	




func sibling_count():
	return get_parent().get_child_count()




func lscon_dynamic_external(src_index, src_node):
	
	if debug: printt("lscon_dynamic_external:", src_index, src_node)

	miller.del_col_post(src_node.get_index())
	lscol_dynamic(src_node, src_node.get_item_metadata(src_index))
	miller.set_process(true)




func lscon_dynamic_external_multi(arg3,src_index, src_node):
	
	if debug: printt("lscon_dynamic_external:", src_index, src_node)

	miller.del_col_post(src_node.get_index())
	lscol_dynamic(src_node, src_node.get_item_metadata(src_index))
	miller.set_process(true)

	


func lscol_dynamic(src_col, path):
	
	if debug: printt( "lscol_dynamic:", str(src_col), str(path) )
	
	var new_col = miller.add_col()
	new_col.connect("item_activated", self, "lscon_dynamic_external", [new_col])
	new_col.connect("item_selected",  self, "lscon_dynamic_external", [new_col])
	
	#ls
	var lst = ls(path)
	#folders
	for dir in lst.dirs:
		if path[-1] != "/": 
			path += "/"
		new_col.add_item(str(dir))
		new_col.set_item_metadata( new_col.get_item_count()-1, str(path,dir)) #set metadata for this last item
		if verbose: printt(new_col.get_item_count(), str(path,dir))
	#files
	for file in lst.files:
		new_col.add_item(str(file))
		new_col.set_item_metadata( new_col.get_item_count()-1, str(path,file)) #set metadata for this last item





func ls(path):
	var dir = Directory.new()
	var dirs = []
	var files = []
	if path and dir.open(path) == OK:
		dir.list_dir_begin(true, true)
		var file_name = dir.get_next()
		while (file_name != ""):
			if dir.current_is_dir():
				dirs.append(file_name)
			else:
				files.append(file_name)
			file_name = dir.get_next()
	return {"path":path, "dirs":dirs, "files":files}


func _on_bookmarks_item_activated(index):
	miller.del_col_post(-1)
	lscol_dynamic(null, find_node("bookmarks").get_item_text(index))


func _on_Button_pressed():
	pass

