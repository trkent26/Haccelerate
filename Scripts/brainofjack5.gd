#See brainofjack.gd comments
extends RigidBody2D

var input_states = preload("res://Assets/Scripts/input_states.gd")

var player
var jump_height = 600
var mov_speed = 200
var node = load("res://pausemenu.xml").instance()
var acceleration = 5
var extra_gravity = 900
var raycast_down = null
var raycast_down_left = null
var raycast_down_right = null
var current_speed = Vector2(0,0)
var btn_right = input_states.new("ui_right")
var btn_left = input_states.new("ui_left")
var btn_jump = input_states.new("ui_up")
var anim
var animation = ""
var animationNew = ""
var health = 6
var jackDamaged
var jackInvi
var isAlive

func move(speed, acc, delta):
	current_speed.x = lerp(current_speed.x, speed, acc * delta)
	set_linear_velocity(Vector2(current_speed.x, get_linear_velocity().y))

func is_on_ground():
	if raycast_down.is_colliding() or raycast_down_right.is_colliding() or raycast_down_left.is_colliding():
		return true
	else:
		return false


func _ready():
	isAlive = true
	
	set_contact_monitor( true )
	set_max_contacts_reported( 100 )
	
	raycast_down = get_node("Feet")
	raycast_down_right = get_node("FeetRight")
	raycast_down_left = get_node("FeetLeft")
	raycast_down.add_exception(self)
	raycast_down_right.add_exception(self)
	raycast_down_left.add_exception(self)
	set_fixed_process(true)
	set_process(true)
	set_applied_force(Vector2(0,extra_gravity))
	anim = get_node("JackSprite/anim")
	
	jackDamaged = false
	jackInvi = false
	
func _fixed_process(delta):
	if btn_left.check() == 2:
		move(-mov_speed, acceleration, delta)
	elif btn_right.check() == 2:
		move(mov_speed, acceleration, delta)
	else:
		move(0, acceleration, delta)
	if is_on_ground():
		if btn_jump.check() == 1:
			set_axis_velocity(Vector2(0, -jump_height))
			get_node("Sounds").play("jump")
	
	if jackDamaged and jackInvi and isAlive:
		if get_linear_velocity().y == 0:
			if get_linear_velocity().x > 3:
				animation = "DamageRunRight"
			elif get_linear_velocity().x < -3:
				animation = "DamageRunLeft"
			else:
				animation = "DamageIdle"
	
		if get_linear_velocity().y < 0 or get_linear_velocity().y > 0:
			if get_linear_velocity().x > 3:
				animation = "DamageFallingRight"
				if Globals.get("isShooting"):
					animation = "JumpShootRight"
			elif get_linear_velocity().x < -3:
				animation = "DamageFallingLeft"
				if Globals.get("isShooting"):
					animation = "JumpShootLeft"
			else:
				animation = "DamageFalling"
				if Globals.get("isShooting"):
					animation = "JumpShoot"
	
	if !jackDamaged and jackInvi and isAlive:
		if get_linear_velocity().y == 0:
			if get_linear_velocity().x > 3:
				animation = "InviRunningRight"
			elif get_linear_velocity().x < -3:
				animation = "InviRunningLeft"
			else:
				animation = "InviIdle"
	
		if get_linear_velocity().y < 0 or get_linear_velocity().y > 0:
			if get_linear_velocity().x > 3:
				animation = "InviFallingRight"
				if Globals.get("isShooting"):
					animation = "JumpShootRight"
			elif get_linear_velocity().x < -3:
				animation = "InviFallingLeft"
				if Globals.get("isShooting"):
					animation = "JumpShootLeft"
			else:
				animation = "InviFalling"
				if Globals.get("isShooting"):
					animation = "JumpShoot"
	
	if !jackDamaged and !jackInvi and isAlive:
		if get_linear_velocity().y == 0:
			if get_linear_velocity().x > 3:
				animation = "RunningRight"
			elif get_linear_velocity().x < -3:
				animation = "RunningLeft"
			else:
				animation = "Idle"
	
		if get_linear_velocity().y < 0 or get_linear_velocity().y > 0:
			if get_linear_velocity().x > 3:
				animation = "FallingRight"
				if Globals.get("isShooting"):
					animation = "JumpShootRight"
			elif get_linear_velocity().x < -3:
				animation = "FallingLeft"
				if Globals.get("isShooting"):
					animation = "JumpShootLeft"
			else:
				animation = "Falling"
				if Globals.get("isShooting"):
					animation = "JumpShoot"
	
	if isAlive:
		if animation != animationNew:
			animationNew = animation
			anim.play(animation)
	
	if (Globals.get("JackLives") == 0) and (get_linear_velocity().x > 3):
		isAlive = false
		get_node("JackSprite/anim").play("DeathRight")
		get_node("Sounds").play("playerdeath")
		get_parent().get_node("StreamPlayer").set_paused(true)
		get_tree().set_pause(true)
	elif Globals.get("JackLives") == 0 and get_linear_velocity().x < -3:
		isAlive = false
		get_node("JackSprite/anim").play("DeathLeft")
		get_node("Sounds").play("playerdeath")
		get_parent().get_node("StreamPlayer").set_paused(true)
		get_tree().set_pause(true)
	elif Globals.get("JackLives") == 0:
		isAlive = false
		get_node("JackSprite/anim").play("DeathRight")
		get_node("Sounds").play("playerdeath")
		get_parent().get_node("StreamPlayer").set_paused(true)
		get_tree().set_pause(true)

func _process(delta):
	if Input.is_action_pressed("ui_menu"):
		get_tree().set_pause(true)
		get_node("/root/BossLevel").add_child(node)
	
	if get_tree().is_paused() == false:
		if get_node("/root/BossLevel").is_a_parent_of(node):
			get_node("/root/BossLevel").remove_child(node)
	
	if Globals.get("JackLives") > 6:
		Globals.set("JackLives", 6)
	
	if Globals.get("JackLives") < 0:
		Globals.set("JackLives", 0)

func _on_Jack_body_enter( body ):
	if body.get_name() == "nextLevel":
		var endtime = Globals.get("time")
		print(endtime)
		Globals.set("LevelFourTime", endtime)
		get_tree().change_scene("res://bosslevel.tscn")
	
	if body.get_name() == "endgame":
		var endtime = Globals.get("time")
		Globals.set("endscore", endtime)
		print(Globals.get("endscore"))
		get_tree().change_scene("res://wingame.tscn")
	

	if body in get_tree().get_nodes_in_group("enemies"):
		if jackInvi == false:
			get_node("Sounds").play("takedamage")
			jackInvi = true
			jackDamaged = true
			var t = Timer.new()
			t.set_wait_time(.3)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			jackDamaged = false
			health = Globals.get("JackLives")
			health -= 1
			Globals.set("JackLives", health)
			print(health)
			var t = Timer.new()
			t.set_wait_time(1.7)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			jackInvi = false
	
	pass # replace with function body