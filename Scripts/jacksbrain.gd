extends RigidBody2D

var player
var feet
var feetleft
var feetright
var jump_height = 300
var mov_speed = 200
var node = load("res://game2/Levels/pausemenu.xml").instance()
var bullet = load("res://game2/Levels/Bullet.xml").instance()

func _ready():
	set_process(true)
	feet = get_node("FeetCenter")
	feetleft = get_node("FeetLeft")
	feetright = get_node("FeetRight")
	feet.add_exception(self)
	feetleft.add_exception(self)
	feetright.add_exception(self)
	set_mode(2)
	
	
func _process(delta):
	if feet.is_colliding() or feetleft.is_colliding() or feetright.is_colliding():
		if Input.is_action_pressed("ui_up"):
			set_axis_velocity(Vector2(0, -jump_height))
	
	if Input.is_action_pressed("ui_right"):
		set_axis_velocity(Vector2(mov_speed,0))
	if Input.is_action_pressed("ui_left"):
		set_axis_velocity(Vector2(-mov_speed,0))
	
	if Input.is_action_pressed("ui_menu"):
		get_tree().set_pause(true)
		get_node("/root/LevelOne").add_child(node)
	
	if get_tree().is_paused() == false:
		get_node("/root/LevelOne").remove_child(node)
	
	if Input.is_action_pressed("Shoot"):
		get_node("/root/LevelOne").add_child(bullet)