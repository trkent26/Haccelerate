extends LinkButton

func _pressed():
	get_tree().change_scene("res://game2/Levels/mainmenu.xml")
	get_tree().set_pause(false)