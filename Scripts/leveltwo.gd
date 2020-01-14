#See levelonebullet.gd comments 
extends Node2D

var bullet = load("res://bullet.tscn")
var isSpacePressed = false
var bulletCount = 0
var bulletArray = []
var timeLabel = load("res://time.tscn").instance()
var livesLabel = load("res://lives.tscn").instance()

var FireTimer = true
var DidShoot = false

func _ready():
	Globals.set("isShooting", false)
	
	add_child(timeLabel)
	add_child(livesLabel)
	
	Globals.set("bullets", [])
	set_process(true)
	pass

func _process(delta):
	if DidShoot == false:
		shoot()
		if DidShoot == true:
			var t = Timer.new()
			t.set_wait_time(.2)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			Globals.set("isShooting", false)
			var t = Timer.new()
			t.set_wait_time(.3)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			DidShoot = false
	
	pass

func shoot():
	if Input.is_action_pressed("Shoot"):
		if isSpacePressed == false:
			isSpacePressed = true
			Globals.set("isShooting", true)
			if get_node("Jack/JackSprite").is_flipped_h() == true:
				Globals.set("velocity", Vector2(-800, 0))
				fireleft()
				get_node("Jack/Sounds").play("shoot")
			else:
				Globals.set("velocity", Vector2(800,0))
				fire()
				get_node("Jack/Sounds").play("shoot")  
			
	else:
		Globals.set("isShooting", false)
		isSpacePressed = false
	




func fire():
	bulletCount += 1
	var bullet_instance = bullet.instance()
	bullet_instance.set_name("bullet" + str(bulletCount))
	get_node("/root/LevelTwo").add_child(bullet_instance)
	var bulletPos = get_node("bullet" + str(bulletCount)).get_pos()
	var jackPos = get_node("Jack").get_pos()
	bulletPos.x = jackPos.x
	bulletPos.y = jackPos.y
	get_node("bullet" + str(bulletCount)).set_pos(bulletPos)
	Globals.get("bullets").append("bullet" + str(bulletCount))
	DidShoot = true

	
func fireleft():
	bulletCount += 1
	var bullet_instance = bullet.instance()
	bullet_instance.set_name("bullet" + str(bulletCount))
	get_node("/root/LevelTwo").add_child(bullet_instance)
	var bulletPos = get_node("bullet" + str(bulletCount)).get_pos()
	var jackPos = get_node("Jack").get_pos()
	bulletPos.x = jackPos.x - 110
	bulletPos.y = jackPos.y
	get_node("bullet" + str(bulletCount)).set_pos(bulletPos)
	Globals.get("bullets").append("bullet" + str(bulletCount))
	DidShoot = true
	