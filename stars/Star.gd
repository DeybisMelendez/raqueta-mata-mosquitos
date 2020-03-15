extends Sprite
var sparks = []

func _ready():
	for i in 9:
		sparks.append(load("res://stars/" + str(i) + ".png"))

func spark():
	texture = sparks[randi()%9]
	$AnimationPlayer.play("spark")
	$AudioStreamPlayer2D.pitch_scale = rand_range(0.8, 1.5)
	$AudioStreamPlayer2D.play()
