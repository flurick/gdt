extends Node

var rec_bius_id = AudioServer.get_bus_index("record")

func _ready():
	$Label.text = AudioServer.capture_get_device()
	print("ready minirec")


func _process(delta):
	if $Button.pressed:
		print ($ColorRect.rect_size.y, $AudioStreamPlayer.volume_db )
	#	$Label.text = AudioServer.get_bus_effect(AudioServer.get_bus_index("record"),0).get_bus_volume_db
		$Label.text = str( AudioServer.get_bus_effect(rec_bius_id,0) )


func _on_Button_toggled(button_pressed):
	
	if $Button.pressed:
		$AudioStreamPlayer.play()
		AudioServer.get_bus_effect(rec_bius_id,0).set_recording_active(true)
	else:
		AudioServer.get_bus_effect(rec_bius_id,0).set_recording_active(false)
		AudioServer.get_bus_effect(rec_bius_id,0).get_recording().save_to_wav("rec.wav")
		print("Saved wav")
