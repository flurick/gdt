extends Label

func _ready():
	text = str("v.", global.sh("git", ["rev-parse", "--short", "HEAD"]).output) 
