#Controls bullet and its collision
extends RigidBody2D

var anim 
var animation = ""
var animationNew = ""
var current_body
var lives = 0
var lives1 = 0


func _ready():	
	
	set_contact_monitor( true ) #Allows bullet to collide
	set_max_contacts_reported( 5 ) #Set max collisions for one bullet
	
	set_mode(2)
	set_linear_velocity(Globals.get("velocity")) #Set bullet speed
	anim = get_node("BulletSprite/bulletAnim") #Set bullet animation 
	#Set bullet animation based on direction
	if Globals.get("velocity").x < 0:
		animation = "idleBulletLeft" 
	elif Globals.get("velocity").x > 0:
		animation = "idleBulletRight"
	
	get_node("bulletCollide").add_exception(self) #Prevents bullet from colliding with itself
	
	set_process(true)
	pass
	
	
func _process(delta):
	#Set bullet explode and animation when colliding
	if get_node("bulletCollide").is_colliding():
		set_linear_velocity(Vector2(0,0))
		animation = "explode"
		if animation != animationNew:
			animationNew = animation
			anim.play(animation) 
		var t = Timer.new()
		t.set_wait_time(.2)
		t.set_one_shot(true)
		add_child(t)
		t.start()
		yield(t, "timeout")
		queue_free()
	
	if animation != animationNew:
		animationNew = animation
		anim.play(animation) 


func _on_Bullet_body_enter( body ):
	#Sets and updates lives of enemies after bullet collides with them
	if body != current_body:
		current_body = body
		if body.get_name() == "ErrorMessage":
			lives = Globals.get("errorLife")
			lives -= 1
			Globals.set("errorLife", lives)
		
		if body.get_name() == "ErrorMessage1":
			lives = Globals.get("errorLife1")
			lives -= 1
			Globals.set("errorLife1", lives)
		
		if body.get_name() == "WiresGuy":
			lives1 = Globals.get("wiresLife")
			lives1 -= 1
			Globals.set("wiresLife", lives1)
		
		if body.get_name() == "Virus":
			lives1 = Globals.get("virusLife")
			lives1 -= 1
			Globals.set("virusLife", lives1)
		
		if body.get_name() == "Virus1":
			lives1 = Globals.get("virusLife1")
			lives1 -= 1
			Globals.set("virusLife1", lives1)
		
		if body.get_name() == "Cursor":
			lives = Globals.get("cursorLife")
			lives -= 1
			Globals.set("cursorLife", lives)
		
		if body.get_name() == "Cursor1":
			lives = Globals.get("cursorLife1")
			lives -= 1
			Globals.set("cursorLife1", lives)
		
		if body.get_name() == "Boss":
			lives = Globals.get("bossLife")
			lives -= 1
			Globals.set("bossLife", lives)