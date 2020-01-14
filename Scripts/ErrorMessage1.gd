#See errorMessage.gd comments
extends RigidBody2D

var alive

func _ready():
	Globals.set("errorLife1", 5)
	add_to_group("enemies")
	alive = true
	set_process(true)
	pass

func _process(delta):
	if alive:
		if Globals.get("errorLife1") == 0:
			alive = false
			get_parent().get_node("ErrorMessageSprite/errorAnim").play("errorDeath")
			queue_free()
	
	if Globals.get("errorLife1") == 5:
		get_node("HealthBar5/errorHealthAnim").play("Health5")
	if Globals.get("errorLife1") == 4:
		get_node("HealthBar5/errorHealthAnim").play("Health4")
	if Globals.get("errorLife1") == 3:
		get_node("HealthBar5/errorHealthAnim").play("Health3")
	if Globals.get("errorLife1") == 2:
		get_node("HealthBar5/errorHealthAnim").play("Health2")
	if Globals.get("errorLife1") == 1:
		get_node("HealthBar5/errorHealthAnim").play("Health1")
	if Globals.get("errorLife1") == 0:
		get_node("HealthBar5/errorHealthAnim").play("Health0")
	