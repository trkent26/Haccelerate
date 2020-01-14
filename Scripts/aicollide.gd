
extends RigidBody2D

var bullet = preload("res://bullet.tscn")

func _ready():
	set_process(true)
	get_colliding_bodies()
	pass

func _process(delta):
	if is_in_group(bullet):
		queue_free()