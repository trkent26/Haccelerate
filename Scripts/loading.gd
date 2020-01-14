#gives game 5 seconds to load
extends Node2D

func _ready():
	#set timer for 5 seconds
	var t = Timer.new()
	t.set_wait_time(5)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")
	#begin intro cutscene
	get_tree().change_scene("res://introcutscene.tscn")