extends CanvasLayer

# Signals needed.
signal victory
signal start_game

var cptPieceOk := 0
var targetPieceOk := 60

# Init the game
func _ready() -> void:
	
	# Connect signals of GUI.
	$RulesAndStart/StarButton.connect("pressed", self, "_on_StarButton_pressed")
	connect("victory", self, "_on_victory")
	
	# Hide result panel.
	$Result.hide()
	
	# Hide pieces
	var pieces = get_tree().get_nodes_in_group("piece")
	for piece in pieces:
		piece.hide()
		piece.connect("pieceOk", self, "_on_piece_ok")

# Start the game
func _on_StarButton_pressed() -> void:
	# Hide rule panel.
	$RulesAndStart.hide()

	# Show pieces
	var pieces = get_tree().get_nodes_in_group("piece")
	for piece in pieces:
		piece.show()

# Victory of user    
func _on_victory() -> void:
	$Result.show()
	$Result/Label.text = "GAGNE"
	$Result/Return.show()
	
func _on_piece_ok() -> void:
	
	cptPieceOk += 1
	print ("Ok : ", cptPieceOk)
	
	if cptPieceOk == targetPieceOk:
		_on_victory()
