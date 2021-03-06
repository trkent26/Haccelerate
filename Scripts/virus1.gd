#See errorMessage.gd comments
extends RigidBody2D

var alive

func _ready():
	Globals.set("virusLife1", 3)
	add_to_group("enemies")
	alive = true
	set_process(true)
	pass

func _process(delta):
	if alive:
		if Globals.get("virusLife1") == 0:
			alive = false
			get_parent().get_node("VirusSprite/virusAnim").play("virusDeath")
			queue_free()
	
	if Globals.get("virusLife1") == 3:
		get_node("HealthBar3/virusHealthAnim").play("Health3")
	if Globals.get("virusLife1") == 2:
		get_node("HealthBar3/virusHealthAnim").play("Health2")
	if Globals.get("virusLife1") == 1:
		get_node("HealthBar3/virusHealthAnim").play("Health1")
	if Globals.get("virusLife1") == 0:
		get_node("HealthBar3/virusHealthAnim").play("Health0")