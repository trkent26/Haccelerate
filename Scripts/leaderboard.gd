#Control the leaderboard using an array of scores
extends Node2D

func _ready():
	set_process(true)
	get_node("Scores/Score1").set_text(str(Globals.get("scoreArray")[0]))
	get_node("Scores/Score2").set_text(str(Globals.get("scoreArray")[1]))
	get_node("Scores/Score3").set_text(str(Globals.get("scoreArray")[2]))
	get_node("Scores/Score4").set_text(str(Globals.get("scoreArray")[3]))
	get_node("Scores/Score5").set_text(str(Globals.get("scoreArray")[4]))
	get_node("Initials/Init1").set_text(Globals.get("initialsArray")[0])
	get_node("Initials/Init2").set_text(Globals.get("initialsArray")[1])
	get_node("Initials/Init3").set_text(Globals.get("initialsArray")[2])
	get_node("Initials/Init4").set_text(Globals.get("initialsArray")[3])
	get_node("Initials/Init5").set_text(Globals.get("initialsArray")[4])
	pass
#Back to menu function
func _process(delta):
	if Input.is_action_pressed("ui_back"):
		get_tree().change_scene("res://mainmenu.tscn")