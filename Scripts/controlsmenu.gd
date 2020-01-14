#Controls back to menu function
extends Node2D

func _ready():
	set_process(true)
	pass

func _process(delta):
	if Input.is_action_pressed("ui_back"):
		get_tree().change_scene("res://mainmenu.tscn")