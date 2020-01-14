#See errorMessage.gd comments 
extends RigidBody2D

var alive

func _ready():
	Globals.set("wiresLife", 3)
	add_to_group("enemies")
	alive = true
	set_process(true)
	pass

func _process(delta):
	if alive:
		if Globals.get("wiresLife") == 0:
			alive = false
			get_parent().get_node("WiresSprite/wiresAnim").play("wiresDeath")
			queue_free()
	
	if Globals.get("wiresLife") == 3:
		get_node("HealthBar3/wiresHealthAnim").play("Health3")
	if Globals.get("wiresLife") == 2:
		get_node("HealthBar3/wiresHealthAnim").play("Health2")
	if Globals.get("wiresLife") == 1:
		get_node("HealthBar3/wiresHealthAnim").play("Health1")
	if Globals.get("wiresLife") == 0:
		get_node("HealthBar3/wiresHealthAnim").play("Health0")