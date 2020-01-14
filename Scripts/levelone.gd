extends Node2D

#var bullet = preload ("res://game2/Levels/Bullet.xml")
#var bulletCount = 0
#var isSpacePressed = false 

func _process(delta):
	if Input.is_key_pressed(KEY_P):
		get_tree().set_pause(true)
		var node = load("res://game2/Levels/pausemenu.xml").instance()
		get_node("/root/LevelOne").add_child(node)
	
	#if Input.is_action_pressed("Shoot"):
	#	if isSpacePressed == false:
	#		get_node("Jack").fire()
	#		isSpacePressed == true
	#else:
	#	isSpacePressed == false
	
	#var playerPosition = get_node("Jack").get_pos()
	#get_node("Jack").set_pos(playerPosition)
	
#func fire():
#	bulletCount = bulletCount + 1
#	print ("fire")
#	var bullet_instance = bullet.instance()
#	bullet_instance.set_name("bullet"+str(bulletCount))
#	add_child(bullet_instance)
#	var bulletPos = get_node("bullet"+str(bulletCount)).get_pos()
#	
#	get_node("bullet"+str(bulletCount)).set_pos(bulletPos)