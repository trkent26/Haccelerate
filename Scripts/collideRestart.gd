#Restart level and lose a life when Jack collidies with body
extends RigidBody2D


func _ready():
	
	pass

func _on_RestartLevel_body_enter( body ):
	if body.get_name() == "Jack":
		var health = Globals.get("JackLives")
		health -= 1
		Globals.set("JackLives", health)
		if Globals.get("JackLives") == 0:
			get_parent().get_node("Jack/JackSprite/anim")
			var t = Timer.new()
			t.set_wait_time(4.5)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_tree().change_scene("res://GameOver.tscn")
		else:
			get_tree().reload_current_scene()
	pass
