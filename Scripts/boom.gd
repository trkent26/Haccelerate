#Plays destruction sound when enemy dies
extends SamplePlayer

var canplay = true
var canplay2 = true
var canplay3 = true
var canplay4 = true
var canplay5 = true
var canplay6 = true
var canplay7 = true

func _ready():
	set_process(true)
	pass

func _process(delta):
	if canplay:
		if Globals.get("errorLife") == 0:
			canplay = false
			play("enemydeath")
	if canplay2:
		if Globals.get("wiresLife") == 0:
			canplay2 = false
			play("enemydeath")
	if canplay3:
		if Globals.get("virusLife") == 0:
			canplay3 = false
			play("enemydeath")
	if canplay4:
		if Globals.get("errorLife1") == 0:
			canplay4 = false
			play("enemydeath")
	if canplay5:
		if Globals.get("cursorLife") == 0:
			canplay5 = false
			play("enemydeath")
	if canplay6:
		if Globals.get("cursorLife1") == 0:
			canplay6 = false
			play("enemydeath")
	if canplay7:
		if Globals.get("virusLife1") == 0:
			canplay7 = false
			play("enemydeath")