
extends Label

var sec_elapsed = 0

var time = 0.000

func _ready():
	set_process(true)
	pass
#Check for time
func _process(delta):
	_on_Time_Elapsed_timeout()
#Update and print time
func _on_Time_Elapsed_timeout():
	sec_elapsed += 1
	var milliseconds = sec_elapsed % 60
	var seconds = sec_elapsed % 3600 / 60
	var minutes = sec_elapsed / 3600
	var str_elapsed = "%02d : %02d : %02d" % [minutes, seconds, milliseconds]
	
	
	time = (minutes*60) + seconds
	
	set_text(str(str_elapsed))
	
	
	Globals.set("time", time)