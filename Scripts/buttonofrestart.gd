extends LinkButton

func _pressed():
	get_tree().reload_current_scene()
	get_tree().set_pause(false)