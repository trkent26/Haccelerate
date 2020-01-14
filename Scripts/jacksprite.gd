#Remove sprite when Jack dies
extends Sprite



func _ready():
	set_process(true)
	pass
func _process(delta):
	if Globals.get("JackLives") == 0:
		var t = Timer.new()
		t.set_wait_time(4.5)
		t.set_one_shot(true)
		add_child(t)
		t.start()
		yield(t, "timeout")
		get_tree().set_pause(false)
		get_tree().change_scene("res://GameOver.tscn")