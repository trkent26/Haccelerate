#Update Jack's lives and heart bar
extends Sprite



func _ready():
	set_process(true)
	pass

func _process(delta):
	if Globals.get("JackLives") == 6:
		set_frame(0)
	if Globals.get("JackLives") == 5:
		set_frame(1)
	if Globals.get("JackLives") == 4:
		set_frame(2)
	if Globals.get("JackLives") == 3:
		set_frame(3)
	if Globals.get("JackLives") == 2:
		set_frame(4)
	if Globals.get("JackLives") == 1:
		set_frame(5)
	if Globals.get("JackLives") == 0:
		set_frame(6)