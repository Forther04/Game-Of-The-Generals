extends Control

@export var text : Label
@export var check_interval = 0.5
var check_timer = 0.0

signal win_screen

func _process(delta: float) -> void:
	check_timer += delta
	if check_timer >= check_interval:
		check_timer = 0
		change_who_moves()

func change_who_moves():
	if Global.win == false:
		if Global.who_moves == false:
			text.text = "Black's Turn"
		elif Global.who_moves == true:
			text.text = "White's Turn"
func _on_back_pressed() -> void:
	$"Ui/Win Screen".hide()
	show_pieces()
	
func show_pieces():
	emit_signal("win_screen")
