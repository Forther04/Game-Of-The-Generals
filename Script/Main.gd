extends Control

var selected_piece = null

func _ready():
	for piece in get_tree().get_nodes_in_group("black_piece"):
		piece.connect("piece_selected", self._on_piece_selected)

func _on_piece_selected(piece):
	if selected_piece != piece:
		if selected_piece:
			selected_piece.deselect()
			print("Deselect")
		selected_piece = piece
		selected_piece.select()
		print("Select")
