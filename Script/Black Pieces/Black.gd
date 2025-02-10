extends Sprite2D


@export var pieces : piece
var off : bool = false
var black_piece_area
enum piece {Flag,General_5,General_4,General_3,General_2,General_1}


func _process(delta: float) -> void:
	change_piece()
	overlapping()
	if Global.piece != $".".name: #Check if a new piece is selected and hide the previous one
		$Choices.hide()
		off = false

func change_piece(): #Changes the piece type
	if pieces == 0:
		self.region_rect = Rect2(0,0,32,32)
		self.name = "Flag"
	if pieces == 1:
		self.region_rect = Rect2(34,0,32,32)
		self.name = "5_General"
	if pieces == 2:
		self.region_rect = Rect2(68,0,32,32)
		self.name = "4_General"
	if pieces == 3:
		self.region_rect = Rect2(102,0,32,32)
		self.name = "3_General"
	if pieces == 4:
		self.region_rect = Rect2(136,0,32,32)
		self.name = "2_General"
	if pieces == 5:
		self.region_rect = Rect2(170,0,32,32)
		self.name = "1_General"


#Check if the piece is selected
func _on_main_pressed() -> void:
	Global.piece = $".".name
	if off == false:
		$Choices.show()
		off = true
	elif off == true:
		$Choices.hide()
		off = false

func overlapping():
	var black = $Black
	if $Choices/Top/TOp.overlaps_area($"../Border/AreaBorder"):
		$Choices/Top.hide()
	else:
		$Choices/Top.show()
	if $Choices/Bottom/BOttom.overlaps_area($"../Border/AreaBorder"):
		$Choices/Bottom.hide()
	else:
		$Choices/Bottom.show()
	if $Choices/Left/Left.overlaps_area($"../Border/AreaBorder"):
		$Choices/Left.hide()
	else:
		$Choices/Left.show()
	if $Choices/Right/Right.overlaps_area($"../Border/AreaBorder"):
		$Choices/Right.hide()
	else:
		$Choices/Right.show()


func _on_top_pressed() -> void:
	$".".position += Vector2(0, -64)
	off = false
	$Choices.hide()
func _on_bottom_pressed() -> void:
	$".".position += Vector2(0, 64)
	off = false
	$Choices.hide()
func _on_left_pressed() -> void:
	$".".position += Vector2(-64, 0)
	off = false
	$Choices.hide()
func _on_right_pressed() -> void:
	$".".position += Vector2(64, 0)
	off = false
	$Choices.hide()
