extends Node2D

#set initial frame
var frameNum = 0

func _ready():
	get_node("FrameEnter").set_hidden(true)
	get_node("FrameSpace").set_hidden(false)
	set_process(true)
	set_process_input(true)
	pass

func _process(delta):
	#if escape is pressed, change scene to level one
	if Input.is_action_pressed("ui_back"):
		get_tree().change_scene("res://leveluno.tscn")
	
	#set dialogue
	get_node("DialogBox").set_frame(frameNum)

func _input(event):
	#if space is pressed
	if frameNum < 17:
		if event.is_action_pressed("Shoot") && event.is_pressed() && !event.is_echo():
			frameNum += 1
	
	#play animation depending on frame
	if frameNum == 0:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
	if frameNum == 1:
		get_node("HansHead/hansHeadAnim").play("hansIdle")
		get_node("JackHead/jackHeadAnim").play("jackBob")
	if frameNum == 2:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
	if frameNum == 3:
		get_node("HansHead/hansHeadAnim").play("hansIdle")
		get_node("JackHead/jackHeadAnim").play("jackBob")
	if frameNum == 4:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
	if frameNum == 5:
		get_node("HansHead/hansHeadAnim").play("hansIdle")
		get_node("JackHead/jackHeadAnim").play("jackBob")
	if frameNum == 6:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
	if frameNum == 7:
		get_node("HansHead/hansHeadAnim").play("hansIdle")
		get_node("JackHead/jackHeadAnim").play("jackBob")
	if frameNum == 8:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
	if frameNum == 9:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
	if frameNum == 10:
		get_node("HansHead/hansHeadAnim").play("hansIdle")
		get_node("JackHead/jackHeadAnim").play("jackBob")
	if frameNum == 11:
		get_node("HansHead/hansHeadAnim").play("hansIdle")
		get_node("JackHead/jackHeadAnim").play("jackBob")
	if frameNum == 12:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
	if frameNum == 13:
		get_node("HansHead/hansHeadAnim").play("hansIdle")
		get_node("JackHead/jackHeadAnim").play("jackBob")
	if frameNum == 14:
		get_node("HansHead/hansHeadAnim").play("hansIdle")
		get_node("JackHead/jackHeadAnim").play("jackBob")
	if frameNum == 15:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
	if frameNum == 16:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
	if frameNum == 17:
		get_node("HansHead/hansHeadAnim").play("hansBob")
		get_node("JackHead/jackHeadAnim").play("jackIdle")
		get_node("FrameEnter").set_hidden(false)
		get_node("FrameSpace").set_hidden(true)
		
	#if dialogue is over, change to level one
	if frameNum == 17:
		if event.is_action_pressed("enter") && event.is_pressed() && !event.is_echo():
			get_tree().change_scene("res://leveluno.tscn")
			