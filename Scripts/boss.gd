#Controls K3V1N
extends RigidBody2D

var alive

func _ready():
	Globals.set("bossLife", 15) #Set K3V1N's lives
	add_to_group("enemies") #Add to enemy group
	alive = true
	set_process(true)
	pass

func _process(delta):
	#Plays death animation when lives are at 0
	if alive:
		if Globals.get("bossLife") == 0:
			alive = false
			get_parent().get_node("BossSprite/BossAnim").play("bossDeath")
			var endtime = Globals.get("time")
			print(endtime)
			Globals.set("bossTime", endtime)
			queue_free()
	#Updates health bar based on lives
	if Globals.get("bossLife") == 15:
		get_node("HealthBar15/bossHealthAnim").play("Health15")
	if Globals.get("bossLife") == 14:
		get_node("HealthBar15/bossHealthAnim").play("Health14")
	if Globals.get("bossLife") == 13:
		get_node("HealthBar15/bossHealthAnim").play("Health13")
	if Globals.get("bossLife") == 12:
		get_node("HealthBar15/bossHealthAnim").play("Health12")
	if Globals.get("bossLife") == 11:
		get_node("HealthBar15/bossHealthAnim").play("Health11")
	if Globals.get("bossLife") == 10:
		get_node("HealthBar15/bossHealthAnim").play("Health10")
	if Globals.get("bossLife") == 9:
		get_node("HealthBar15/bossHealthAnim").play("Health9")
	if Globals.get("bossLife") == 8:
		get_node("HealthBar15/bossHealthAnim").play("Health8")
	if Globals.get("bossLife") == 7:
		get_node("HealthBar15/bossHealthAnim").play("Health7")
	if Globals.get("bossLife") == 6:
		get_node("HealthBar15/bossHealthAnim").play("Health6")
	if Globals.get("bossLife") == 5:
		get_node("HealthBar15/bossHealthAnim").play("Health5")
	if Globals.get("bossLife") == 4:
		get_node("HealthBar15/bossHealthAnim").play("Health4")
	if Globals.get("bossLife") == 3:
		get_node("HealthBar15/bossHealthAnim").play("Health3")
	if Globals.get("bossLife") == 2:
		get_node("HealthBar15/bossHealthAnim").play("Health2")
	if Globals.get("bossLife") == 1:
		get_node("HealthBar15/bossHealthAnim").play("Health1")
	if Globals.get("bossLife") == 0:
		get_node("HealthBar15/bossHealthAnim").play("Health0")
	