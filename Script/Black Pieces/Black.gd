extends Sprite2D


@export var pieces : piece
enum piece {Flag,General_5,General_4,General_3,General_2,General_1}


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
