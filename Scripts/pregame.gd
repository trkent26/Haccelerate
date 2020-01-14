#Instantiates array and plays intro
extends Node2D

func _ready():

	Globals.set("scoreArray", [120, 130, 150, 200, 500])
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Globals.set("initialsArray", ["SHV", "TRK", "JLG", "YIH", "APK"])
	
	get_node("IntroSound").play("INTRO")
	
	var t = Timer.new()
	t.set_wait_time(.3)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")
	get_node("Sprite/IntroAnim").play("Intro")

	var t = Timer.new()
	t.set_wait_time(12.1)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")
	
	get_tree().change_scene("res://mainmenu.tscn")
	pass