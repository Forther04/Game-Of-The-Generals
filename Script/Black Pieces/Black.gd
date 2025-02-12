extends Sprite2D


@export var pieces : piece
@export var right_area : Area2D
@export var left_area : Area2D
@export var top_area : Area2D
@export var bottom_area : Area2D
@export var check_interval = 0.2
var starting :bool = false
var off : bool = false
var black_piece_area
var check_timer = 0.0
var piece_strengt : int


enum piece {Flag,General_5,General_4,General_3,General_2,General_1, Colonel, LT_Colonel, Major, Captain, Lieut_1, Lieut_2, Sergeant, Spy, Private, Questionmark}

##_______________________________________________________________________________
func _ready():
	$"../..".win_screen.connect(show_pieces)
	change_piece()
	if Global.player == false:
		self.region_rect = Rect2(0,68,32,32)
func show_pieces():
	change_piece()
func _process(delta: float) -> void:
	check_timer += delta
	if Global.piece != $".".name: #Check if a new piece is selected and hide the previous one
		$Choices.hide()
		off = false
	if check_timer >= check_interval:
		check_timer = 0
		overlapping()
		player_move()

func reveal():
	change_piece()
	$".".self_modulate = Color(1,1,1,1)

func change_piece(): #Changes the piece type
	if pieces == 0:
		self.region_rect = Rect2(0,0,32,32)
		self.name = "Flag"
		piece_strengt = 1
	if pieces == 1:
		self.region_rect = Rect2(34,0,32,32)
		self.name = "5_General"
		piece_strengt = 14
	if pieces == 2:
		self.region_rect = Rect2(68,0,32,32)
		self.name = "4_General"
		piece_strengt = 13
	if pieces == 3:
		self.region_rect = Rect2(102,0,32,32)
		self.name = "3_General"
		piece_strengt = 12
	if pieces == 4:
		self.region_rect = Rect2(136,0,32,32)
		self.name = "2_General"
		piece_strengt = 11
	if pieces == 5:
		self.region_rect = Rect2(170,0,32,32)
		self.name = "1_General"
		piece_strengt = 10
	if pieces == 6:
		self.region_rect = Rect2(34,34,32,32)
		self.name = "Colonel"
		piece_strengt = 9
	if pieces == 7:
		self.region_rect = Rect2(68,34,32,32)
		self.name = "LT_Colonel"
		piece_strengt = 8
	if pieces == 8:
		self.region_rect = Rect2(102,34,32,32)
		self.name = "Major"
		piece_strengt = 7
	if pieces == 9:
		self.region_rect = Rect2(34,68,32,32)
		self.name = "Captain"
		piece_strengt = 6
	if pieces == 10:
		self.region_rect = Rect2(68,68,32,32)
		self.name = "Lieut_1"
		piece_strengt = 5
	if pieces == 11:
		self.region_rect = Rect2(102,68,32,32)
		self.name = "Lieut_2"
		piece_strengt = 4
	if pieces == 12:
		self.region_rect = Rect2(34,102,32,32)
		self.name = "Sergeant"
		piece_strengt = 3
	if pieces == 13:
		self.region_rect = Rect2(68,102,32,32)
		self.name = "Spy"
		piece_strengt = 15
	if pieces == 14:
		self.region_rect = Rect2(102,102,32,32)
		self.name = "Private"
		piece_strengt = 2



func player_move(): #Detect if it's black current move
	if Global.win == false:
		if Global.who_moves == true:
			$Main.hide()
			$".".self_modulate = Color(0.3,0.3,0.3,255)
		else:
			$Main.show()
			$".".self_modulate = Color(1,1,1,1)

#Check if the piece is selected
func _on_main_pressed() -> void:
	if starting == false:
		Global.black_strength = piece_strengt
		starting = true
	if Global.who_moves == false and Global.win == false:
		Global.piece = $".".name
		if off == false:
			$Choices.show()
			off = true
		elif off == true:
			$Choices.hide()
			off = false

#SOUND EFFECT_____________________________
func move():
	$move.pitch_scale = randf_range(0.8, 1.2)
	$move.play()
func capture():
	$capture.pitch_scale = randf_range(0.8, 1.2)
	$capture.play()
#_________________________________________


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
#FLAG__________________________________________________
	if self.name.contains("Flag"):
		for area in bottom:
			if area.is_in_group("White_area"):  
				if bottom_area.overlaps_area(area):
					$Choices/Bottom.hide()
		for area in top:
			if area.is_in_group("White_area"):  
				if top_area.overlaps_area(area):
					$Choices/Top.hide()
		for area in left:
			if area.is_in_group("White_area"):  
				if left_area.overlaps_area(area):
					$Choices/Left.hide()
		for area in right:
			if area.is_in_group("White_area"):  
				if right_area.overlaps_area(area):
					$Choices/Right.hide()







#Move the piece __________________________
func _on_top_pressed() -> void:
	$".".position += Vector2(0, -64)
	off = false
	$Choices.hide()
	Global.who_moves = true
	move()
func _on_bottom_pressed() -> void:
	$".".position += Vector2(0, 64)
	off = false
	$Choices.hide()
	Global.who_moves = true
	move()
func _on_left_pressed() -> void:
	$".".position += Vector2(-64, 0)
	off = false
	$Choices.hide()
	Global.who_moves = true
	move()
func _on_right_pressed() -> void:
	$".".position += Vector2(64, 0)
	off = false
	$Choices.hide()
	Global.who_moves = true
	move()
#__________________________________________

#CAPTURE___________________________________
func _on_black_main_area_area_entered(area: Area2D) -> void:
	var main = $Black_Main_Area.get_overlapping_areas()
	capture()
	Global.black_strength = piece_strengt
	var black = $Black_Main_Area.get_overlapping_areas()
	if self.name.contains("Flag"):
		for i in main:
			if i.is_in_group("White_Base"):  
				if $Black_Main_Area.overlaps_area(area):
					win_condition()
					print("win")
	for i in black:
		if i.is_in_group("White_area"):  
			if $Black_Main_Area.overlaps_area(i):
				if Global.white_strength == 1:
					print("captured whites flag")
					win_condition()
				if Global.white_strength >= Global.black_strength:
					queue_free()

func win_condition():
	$"../../Win Screen/Label".text = "Black Wins"
	$"../../Win Screen".show()
	$"../../Win Screen/AnimationPlayer".play("Win")
	Global.win = true
	$Main.disabled = true
	$"../../Label".text = "BlackWins"
