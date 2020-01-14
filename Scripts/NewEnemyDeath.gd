extends RigidBody2D

func _ready():
	Globals.set("errorLife1", 3)
	set_process(true)
	pass

func _process(delta):
	if Globals.get("errorLife1") == 0:
		print("dead")
		queue_free()