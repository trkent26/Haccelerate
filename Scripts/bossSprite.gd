#Controls K3V1N's sprite
extends Sprite

var alive = true
var play = true

func _ready():
	set_fixed_process(true)
	set_process(true)
	pass
func _fixed_process(delta):
	if alive:
		get_parent().set_offset(get_parent().get_offset() + (100*delta)) #Move along path
	#Removes sprite when lives are 0 and sets timer
	if Globals.get("bossLife") == 0:
		get_parent().get_parent().get_parent().get_node("StreamPlayer").set_paused(true)
		alive = false
		var t = Timer.new()
		t.set_wait_time(1)
		t.set_one_shot(true)
		add_child(t)
		t.start()
		yield(t, "timeout")
		#Plays death sound
		if play:
			play = false
			get_parent().get_parent().get_parent().get_node("Jack/Boom").play("bossdeath")
		#Goes to win game screen when K3V1N dies
		var t = Timer.new()
		t.set_wait_time(2)
		t.set_one_shot(true)
		add_child(t)
		t.start()
		yield(t, "timeout")
		queue_free()
		get_tree().change_scene("res://wingame.tscn")