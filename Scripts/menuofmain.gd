#Controls main menu
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
				var x = get_node("MainMenu/Arrow").get_pos().x
				var y = get_node("MainMenu/Arrow").get_pos().y - 48
				get_node("MenuSFX").play("menumove")
				get_node("MainMenu/Arrow").set_pos(Vector2(x,y))
		if event.is_action("down") && event.is_pressed() && !event.is_echo():
			if (index != 4):
				index += 1
				var x = get_node("MainMenu/Arrow").get_pos().x
				var y = get_node("MainMenu/Arrow").get_pos().y + 48
				get_node("MenuSFX").play("menumove")
				get_node("MainMenu/Arrow").set_pos(Vector2(x,y))
	#Button selection
	if event.is_action("select") && event.is_pressed() && !event.is_echo():
		if (index == 0):
			move = false
			get_node("MenuSFX").play("menuenter")
			var t = Timer.new()
			t.set_wait_time(1)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_tree().change_scene("res://LoadScreen.tscn")
		if (index == 1):
			move = false
			get_node("MenuSFX").play("menuenter")
			var t = Timer.new()
			t.set_wait_time(1)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_tree().change_scene("res://controlsmenu.tscn")
		if (index == 2):
			move = false
			get_node("MenuSFX").play("menuenter")
			var t = Timer.new()
			t.set_wait_time(1)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_tree().change_scene("res://creditsmenu.tscn")
		if (index == 3):
			move = false
			get_node("MenuSFX").play("menuenter")
			var t = Timer.new()
			t.set_wait_time(1)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_tree().change_scene("res://leaderboard.tscn")
		if (index == 4):
			move = false
			get_node("MenuSFX").play("menuenter")
			var t = Timer.new()
			t.set_wait_time(1)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_tree().quit()