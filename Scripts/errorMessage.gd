#Controls enemy lives, collision, and animation 
extends RigidBody2D

var alive

func _ready():
	Globals.set("errorLife", 5) #Set enemy life
	add_to_group("enemies") #add to colliding group "enemies"
	alive = true
	set_process(true)
	pass

func _process(delta):
	#Plays death animation
	if alive:
		if Globals.get("errorLife") == 0:
			alive = false
			get_parent().get_node("ErrorMessageSprite/errorAnim").play("errorDeath")
			queue_free()
	#Sets and updates health bar above enemy 
	if Globals.get("errorLife") == 5:
		get_node("HealthBar5/errorHealthAnim").play("Health5")
	if Globals.get("errorLife") == 4:
		get_node("HealthBar5/errorHealthAnim").play("Health4")
	if Globals.get("errorLife") == 3:
		get_node("HealthBar5/errorHealthAnim").play("Health3")
	if Globals.get("errorLife") == 2:
		get_node("HealthBar5/errorHealthAnim").play("Health2")
	if Globals.get("errorLife") == 1:
		get_node("HealthBar5/errorHealthAnim").play("Health1")
	if Globals.get("errorLife") == 0:
		get_node("HealthBar5/errorHealthAnim").play("Health0")
	