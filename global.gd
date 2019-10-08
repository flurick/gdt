extends Node

func ls(path="res://"):
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


func scan_dir(path):
	var file_name
	var files = []
#	var dirs = []
	var dir = Directory.new()
	var error = dir.open(path)
	
	if error!=OK:
		print("Can't open "+path+"!")
		return ["fail"]
	
	dir.list_dir_begin(true)
	file_name = dir.get_next()
	while file_name!="":
		if dir.current_is_dir():
			var new_path = path+"/"+file_name
			files = files + scan_dir(new_path)
#			files.append( scan_dir(new_path) )
		else:
			var name = path+"/"+file_name
			files.append(name)
		file_name = dir.get_next()
	dir.list_dir_end()
	
	return files



func sh(command, args=[]):
	var err = []
	var output = []
	err = OS.execute(command, PoolStringArray(args), true, output)
	return {"output":output[0], "err":err}
