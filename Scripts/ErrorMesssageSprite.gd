extends Sprite

func _ready():
	set_fixed_process(true)
	Globals.set("errorLife", 3)
	set_process(true)
	pass
func _fixed_process(delta):
	get_parent().set_offset(get_parent().get_offset() + (100*delta))
	if Globals.get("errorLife") == 0:
		print("dead")
		queue_free()