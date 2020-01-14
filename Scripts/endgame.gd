#Controls victory screen
extends Node2D

var endScore = 0

var isAPressed = false
var isBPressed = false
var isCPressed = false
var isDPressed = false
var isEPressed = false
var isFPressed = false
var isGPressed = false
var isHPressed = false
var isIPressed = false
var isJPressed = false
var isKPressed = false
var isLPressed = false
var isMPressed = false
var isNPressed = false
var isOPressed = false
var isPPressed = false
var isQPressed = false
var isRPressed = false
var isSPressed = false
var isTPressed = false
var isUPressed = false
var isVPressed = false
var isWPressed = false
var isXPressed = false
var isYPressed = false
var isZPressed = false

var initials = ""
var length
var set = true

func _ready():
	length = 0
	#Adds up time for each level to create score
	endScore += Globals.get("LevelOneTime")
	endScore += Globals.get("LevelTwoTime")
	endScore += Globals.get("LevelThreeTime")
	endScore += Globals.get("LevelFourTime")
	endScore += Globals.get("bossTime")
	#set score on victory screen
	get_node("CanvasLayer/score").set_text(str(endScore))
	#Updates array based on score
	if endScore < Globals.get("scoreArray")[4]:
		if endScore < Globals.get("scoreArray")[3]:
			if endScore < Globals.get("scoreArray")[2]:
				if endScore < Globals.get("scoreArray")[1]:
					if endScore < Globals.get("scoreArray")[0]:
						Globals.get("scoreArray").insert(0, endScore)
					else:
						Globals.get("scoreArray").insert(1, endScore)
				else:
					Globals.get("scoreArray").insert(2, endScore)
			else:
				Globals.get("scoreArray").insert(3, endScore)
		else:
			Globals.get("scoreArray").insert(4, endScore)
	
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")
	
	set_process(true)
	
	pass
#Updates initals based on key pressed
func _process(delta):
	if Input.is_action_pressed("A"):
		if isAPressed == false:
			isAPressed = true
			initials += "A"
			length += 1
	else:
		isAPressed = false
	if Input.is_action_pressed("B"):
		if isBPressed == false:
			isBPressed = true
			initials += "B"
			length += 1
	else:
		isBPressed = false
	if Input.is_action_pressed("C"):
		if isCPressed == false:
			isCPressed = true
			initials += "C"
			length += 1
	else:
		isCPressed = false
	if Input.is_action_pressed("D"):
		if isDPressed == false:
			isDPressed = true
			initials += "D"
			length += 1
	else:
		isDPressed = false
	if Input.is_action_pressed("E"):
		if isEPressed == false:
			isEPressed = true
			initials += "E"
			length += 1
	else:
		isEPressed = false
	if Input.is_action_pressed("F"):
		if isFPressed == false:
			isFPressed = true
			initials += "F"
			length += 1
	else:
		isFPressed = false
	if Input.is_action_pressed("G"):
		if isGPressed == false:
			isGPressed = true
			initials += "G"
			length += 1
	else:
		isGPressed = false
	if Input.is_action_pressed("H"):
		if isHPressed == false:
			isHPressed = true
			initials += "H"
			length += 1
	else:
		isHPressed = false
	if Input.is_action_pressed("I"):
		if isIPressed == false:
			isIPressed = true
			initials += "I"
			length += 1
	else:
		isIPressed = false
	if Input.is_action_pressed("J"):
		if isJPressed == false:
			isJPressed = true
			initials += "J"
			length += 1
	else:
		isJPressed = false
	if Input.is_action_pressed("K"):
		if isKPressed == false:
			isKPressed = true
			initials += "K"
			length += 1
	else:
		isKPressed = false
	if Input.is_action_pressed("L"):
		if isLPressed == false:
			isLPressed = true
			initials += "L"
			length += 1
	else:
		isLPressed = false
	if Input.is_action_pressed("M"):
		if isMPressed == false:
			isMPressed = true
			initials += "M"
			length += 1
	else:
		isMPressed = false
	if Input.is_action_pressed("N"):
		if isNPressed == false:
			isNPressed = true
			initials += "N"
			length += 1
	else:
		isNPressed = false
	if Input.is_action_pressed("O"):
		if isOPressed == false:
			isOPressed = true
			initials += "O"
			length += 1
	else:
		isOPressed = false
	if Input.is_action_pressed("P"):
		if isPPressed == false:
			isPPressed = true
			initials += "P"
			length += 1
	else:
		isPPressed = false
	if Input.is_action_pressed("Q"):
		if isQPressed == false:
			isQPressed = true
			initials += "Q"
			length += 1
	else:
		isQPressed = false
	if Input.is_action_pressed("R"):
		if isRPressed == false:
			isRPressed = true
			initials += "R"
			length += 1
	else:
		isRPressed = false
	if Input.is_action_pressed("S"):
		if isSPressed == false:
			isSPressed = true
			initials += "S"
			length += 1
	else:
		isSPressed = false
	if Input.is_action_pressed("T"):
		if isTPressed == false:
			isTPressed = true
			initials += "T"
			length += 1
	else:
		isTPressed = false
	if Input.is_action_pressed("U"):
		if isUPressed == false:
			isUPressed = true
			initials += "U"
			length += 1
	else:
		isUPressed = false
	if Input.is_action_pressed("V"):
		if isVPressed == false:
			isVPressed = true
			initials += "V"
			length += 1
	else:
		isVPressed = false
	if Input.is_action_pressed("W"):
		if isWPressed == false:
			isWPressed = true
			initials += "W"
			length += 1
	else:
		isWPressed = false
	if Input.is_action_pressed("X"):
		if isXPressed == false:
			isXPressed = true
			initials += "X"
			length += 1
	else:
		isXPressed = false
	if Input.is_action_pressed("Y"):
		if isYPressed == false:
			isYPressed = true
			initials += "Y"
			length += 1
	else:
		isYPressed = false
	if Input.is_action_pressed("Z"):
		if isZPressed == false:
			isZPressed = true
			initials += "Z"
			length += 1
	else:
		isZPressed = false
	#Sets initals length less than 3 and prints initals
	if length <= 3:
		get_node("CanvasLayer/Initials").set_text(initials)
	#Adds score to array for score screen
	if Input.is_action_pressed("ui_accept"):
		if length < 3:
			var pos = Globals.get("scoreArray").find(endScore)
			Globals.get("initialsArray").insert(pos, initials)
		get_tree().change_scene("res://mainmenu.tscn")
	
	if length == 3:
		if set:
			set = false
			var pos = Globals.get("scoreArray").find(endScore)
			Globals.get("initialsArray").insert(pos, initials)
			