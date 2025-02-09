extends Sprite2D


@onready var button: Button = $Button
@onready var top: Area2D = $Choices/Top/TOp
@onready var bottom: Area2D = $Choices/Bottom/BOttom
@onready var left: Area2D = $Choices/Left/Left
@onready var right: Area2D = $Choices/Right/Right


@export var pieces : piece
enum piece {Flag,General_5,General_4,General_3,General_2,General_1}

var currently_selected : bool = false
var selected : bool = false
var picked : bool = false

signal piece_selected(piece)


func _process(delta: float) -> void:
	change_piece()
	if top.overlaps_area($"../Border/Top"):
		print("Overlaped with Top")
		$Choices/Top.hide()
	if left.overlaps_area($"../Border/Left"):
		print("Overlaped with Left")
		$Choices/Left.hide()
	if right.overlaps_area($"../Border/Right"):
		print("Overlaped with Right")
		$Choices/Right.hide()
	if bottom.overlaps_area($"../Border/Bottom"):
		print("Overlaped with Bottom")
		$Choices/Bottom.hide()
	if !top.overlaps_area($"../Border/Top"):
		print("Overlaped with Top")
		$Choices/Top.show()
	if !left.overlaps_area($"../Border/Left"):
		print("Overlaped with Left")
		$Choices/Left.show()
	if !right.overlaps_area($"../Border/Right"):
		print("Overlaped with Right")
		$Choices/Right.show()
	if !bottom.overlaps_area($"../Border/Bottom"):
		print("Overlaped with Bottom")
		$Choices/Bottom.show()


func change_piece():
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


func select():
	selected = true
	$Selected.play("Selected")
func deselect():
	selected = false
	$Selected.stop()

func _on_button_pressed():
	emit_signal("piece_selected", self)
	if picked == false:
		$Choices.show()
		picked = true
	else:
		picked = false
		$Choices.hide()


func _on_top_pressed() -> void:
	$".".position.y -= 64
	$Choices.hide()
	$Selected.stop()
