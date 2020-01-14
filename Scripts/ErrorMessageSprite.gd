#Controls enemy sprite and path
extends Sprite

var alive = true

func _ready():
	set_fixed_process(true)
	set_process(true)
	pass
func _fixed_process(delta):
	if alive:
		get_parent().set_offset(get_parent().get_offset() + (100*delta)) #Moves enemy along path
	#Removes sprite when enemy dies
	if Globals.get("errorLife") == 0:
		alive = false
		var t = Timer.new()
		t.set_wait_time(1.2)
		t.set_one_shot(true)
		add_child(t)
		t.start()
		yield(t, "timeout")
		queue_free()