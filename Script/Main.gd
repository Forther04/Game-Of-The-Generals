extends Control

@export var text : Label
@export var check_interval = 0.5
var check_timer = 0.0



func _process(delta: float) -> void:
	check_timer += delta
	if check_timer >= check_interval:
		check_timer = 0
		change_who_moves()
		print("Change")

func change_who_moves():
	if Global.who_moves == false:
		text.text = "Black's Turn"
	elif Global.who_moves == true:
		text.text = "White's Turn"
