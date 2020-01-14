#Controls Gamer Over Screen
extends Node2D

var index = 0
var move

func _ready():
	move = true
	get_tree().set_pause(false)
	set_process_input(true)

func _input(event):
	#Moves arrow
	if move:
		if event.is_action("up") && event.is_pressed() && !event.is_echo():
			if(index != 0):
				index -= 1
				var x = get_node("Arrow").get_pos().x
				var y = get_node("Arrow").get_pos().y - 118
				get_node("MenuSFX").play("menumove")
				get_node("Arrow").set_pos(Vector2(x,y))
		if event.is_action("down") && event.is_pressed() && !event.is_echo():
			if (index != 1):
				index += 1
				var x = get_node("Arrow").get_pos().x
				var y = get_node("Arrow").get_pos().y + 118
				get_node("MenuSFX").play("menumove")
				get_node("Arrow").set_pos(Vector2(x,y))
	#Controls button actions and sounds when pressed
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
			get_tree().change_scene("res://leveluno.tscn")
		if (index == 1):
			move = false
			get_node("MenuSFX").play("menuenter")
			var t = Timer.new()
			t.set_wait_time(1)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_tree().change_scene("res://mainmenu.tscn")