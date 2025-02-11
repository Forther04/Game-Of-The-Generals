extends Sprite2D


@export var pieces : piece
@export var right_area : Area2D
@export var left_area : Area2D
@export var top_area : Area2D
@export var bottom_area : Area2D
var off : bool = false
var black_piece_area
var check_timer = 0.0
@export var check_interval = 0.2

enum piece {Flag,General_5,General_4,General_3,General_2,General_1}


func _process(delta: float) -> void:
	change_piece()
	check_timer += delta
	if Global.piece != $".".name: #Check if a new piece is selected and hide the previous one
		$Choices.hide()
		off = false
	if check_timer >= check_interval:
		check_timer = 0
		overlapping()


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
	var right = right_area.get_overlapping_areas()
	var left = left_area.get_overlapping_areas()
	var top = top_area.get_overlapping_areas()
	var bottom = bottom_area.get_overlapping_areas()

	var black = $Black
	if $Choices/Top/TOp.overlaps_area($"../Border/AreaBorder"):
		$Choices/Top.hide()
	else:
		$Choices/Top.show()
	if bottom_area.overlaps_area($"../Border/AreaBorder"):
		$Choices/Bottom.hide()
	else:
		$Choices/Bottom.show()
	if left_area.overlaps_area($"../Border/AreaBorder"):
		$Choices/Left.hide()
	else:
		$Choices/Left.show()
	if right_area.overlaps_area($"../Border/AreaBorder"):
		$Choices/Right.hide()
	else:
		$Choices/Right.show()
		
	for area in right:
		if area.is_in_group("Black_Area"):  
			if right_area.overlaps_area(area):
				$Choices/Right.hide()
	for area in left:
		if area.is_in_group("Black_Area"):  
			if left_area.overlaps_area(area):
				$Choices/Left.hide()
	for area in top:
		if area.is_in_group("Black_Area"):  
			if top_area.overlaps_area(area):
				$Choices/Top.hide()
	for area in bottom:
		if area.is_in_group("Black_Area"):  
			if bottom_area.overlaps_area(area):
				$Choices/Bottom.hide()





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
