extends Button


var month_of = ["January","February","March","April","May","June","July","August","September","October","November","December"]
var day_of = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday","today","tomorrow","yesterday","fortnight"]
func _on_Timer_timeout():
	var the = OS.get_datetime()
	text = str( the.hour, ":", the.minute, ":", the.second, " ", day_of[the.weekday].substr(0,3), " the ", the.day, "th of ", month_of[the.month].substr(0,3) )
