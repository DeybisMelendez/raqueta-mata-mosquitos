extends Control

onready var Rate = $VBoxContainer/Rate
onready var Activate = $VBoxContainer/HBoxContainer2/Activate
onready var Score = $VBoxContainer/HBoxContainer/Score

var score = 0
func _ready():
	Rate.connect("button_up", self, "rate")
func rate():
	OS.shell_open("https://play.google.com/store/apps/details?id=com.damv.raqueta_mata_mosquitos")
func _physics_process(_delta):
	if Activate.pressed:
		var gyroscope = 10#Input.get_gyroscope().length()
		var random
		if gyroscope > 10:
			random = randi()%3
		elif gyroscope > 6:
			random = randi()%10
		elif gyroscope > 3:
			random = randi()%15
		elif gyroscope > 1:
			random = randi()%40
		if random == 0:
			score += 1
			set_score(score)
			$CenterContainer/Control.get_child(randi()%25).spark()
	elif score != 0:
		score = 0
		set_score(score)
func set_score(s):
	Score.text = "Score: " + str(s)
