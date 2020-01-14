#See HealthPickup.gd comments
extends RigidBody2D

var health
var getlife

func _ready():
	getlife = false
	pass

func _on_HealthPickup2_body_enter( body ):
	if getlife == false:
		if body.get_name() == "Jack":
			getlife = true
			get_node("HealthSound").play("lifeup")
			health = Globals.get("JackLives")
			health += 1
			Globals.set("JackLives", health)
			print(health)
			get_node("healthSprite/healthAnim").play("open")
			var t = Timer.new()
			t.set_wait_time(1.5)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			queue_free()