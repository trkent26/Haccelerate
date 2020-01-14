#See errorMessage.gd comments
extends RigidBody2D

var alive

func _ready():
	Globals.set("cursorLife", 5)
	add_to_group("enemies")
	alive = true
	set_process(true)
	pass

func _process(delta):
	if alive:
		if Globals.get("cursorLife") == 0:
			alive = false
			get_parent().get_node("CursorSprite/cursorAnim").play("cursorDeath")
			queue_free()
	
	if Globals.get("cursorLife") == 5:
		get_node("HealthBar5/cursorHealthAnim").play("Health5")
	if Globals.get("cursorLife") == 4:
		get_node("HealthBar5/cursorHealthAnim").play("Health4")
	if Globals.get("cursorLife") == 3:
		get_node("HealthBar5/cursorHealthAnim").play("Health3")
	if Globals.get("cursorLife") == 2:
		get_node("HealthBar5/cursorHealthAnim").play("Health2")
	if Globals.get("cursorLife") == 1:
		get_node("HealthBar5/cursorHealthAnim").play("Health1")
	if Globals.get("cursorLife") == 0:
		get_node("HealthBar5/cursorHealthAnim").play("Health0")
	
#	_integrate_forces(get_mode())

#func _integrate_forces(state):
#	var contacts = state.get_contact_count()
#	if (contacts > 0):
#		for i in range(contacts):
#			print(state.get_contact_local_shape(i))