extends Control


func sh(command, args=[]):
	var err = []
	var output = []
	err = OS.execute(command, PoolStringArray(args), true, output)
	return {"output":output[0], "err":err}


func _ready():
	
	#git version
	$version.text = str(sh("git", ["--version"]).output)
	
	
	#list repos
#	$ItemList.set_default_cursor_shape(Control.CURSOR_BUSY)
#	for file in global.scan_dir("/home/flu/Projects"):
#		if file.ends_with("git"):
#			$ItemList.add_item( str(file).right(file.length()-10) )#.split("/")[-1]) )
#			$ItemList.set_item_tooltip( $ItemList.get_item_count()-1, file )
#	$ItemList.set_default_cursor_shape(Control.CURSOR_ARROW)
	
	for repo in sh("find",["/home","-name",".git","-printf","%p::"]).output.split("::"):
		$ItemList.add_item( repo.split("/")[ repo.split("/").size()-2 ] )
		

	
#	print( sh("find", ["-name","Qt"], true, a) )
#	err = OS.execute("find", PoolStringArray(["-maxdepth","3", "-name",".git"]), false, output)
#	print(err, output)
	
	#find -name ".git"
#	err = OS.execute("find", PoolStringArray(["-name",".git"]), true, output)
#	$CenterContainer/Button.text = str(output[0])
#	print("err: ", err, "\n", "output: ", output)
#	a = sh("find", ["-name",".git", "-printf", "%p::"])
	
	
	
#	err = OS.execute("sleep", PoolStringArray(["3"]), false, output)
##	$CenterContainer/Button.text = str(output[0])
#	print("err: ", err, "\n", "output: ", output)
	
#	err = OS.execute("sleep", PoolStringArray(["3"]), true, output)
#	$CenterContainer/Button.text = str(output[0])
#	print("err: ", err, "\n", "output: ", output)
#
#func _process(delta):
#	print(err, output)

var f = File.new()
func _on_FileDialog_dir_selected(dir):
	
	$ItemList.clear()
	for path in global.scan_dir(dir+".git/refs/heads"):
		$ItemList.add_item(path)
		f.open(path, f.READ)
		$ItemList.set_item_tooltip( $ItemList.get_item_count()-1, f.get_as_text() )
		f.close()
	
	for line in sh("git",["log","--oneline"]).output.split("\n"):
		$log.add_item( line )
	
	print( sh("git",["log","--oneline"]) )
		
		