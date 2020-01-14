#Controls pause menu
extends Node2D

var index = 0
var move

func _ready():
	move = true
	set_process_input(true)

func _input(event):
	#Arrow key movement
	if move:
		if event.is_action("up") && event.is_pressed() && !event.is_echo():
			if(index != 0):
				index -= 1
				var x = get_node("MenuScreen/Arrow").get_pos().x
				var y = get_node("MenuScreen/Arrow").get_pos().y - 66
				get_node("PauseMenuSFX").play("menumove")
				get_node("MenuScreen/Arrow").set_pos(Vector2(x,y))
		if event.is_action("down") && event.is_pressed() && !event.is_echo():
			if (index != 2):
				index += 1
				var x = get_node("MenuScreen/Arrow").get_pos().x
				var y = get_node("MenuScreen/Arrow").get_pos().y + 66
				get_node("PauseMenuSFX").play("menumove")
				get_node("MenuScreen/Arrow").set_pos(Vector2(x,y))
	#Button selection
	if event.is_action("select") && event.is_pressed() && !event.is_echo():
		if (index == 0):
			move = false
			get_node("PauseMenuSFX").play("menuenter")
			get_tree().set_pause(false)
		if (index == 1):
			move = false
			get_node("PauseMenuSFX").play("menuenter")
			var t = Timer.new()
			t.set_wait_time(1)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_tree().reload_current_scene()
			get_tree().set_pause(false)
		if (index == 2):
			move = false
			get_node("PauseMenuSFX").play("menuenter")
			var t = Timer.new()
			t.set_wait_time(1)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_tree().change_scene("res://mainmenu.tscn")
			get_tree().set_pause(false)




