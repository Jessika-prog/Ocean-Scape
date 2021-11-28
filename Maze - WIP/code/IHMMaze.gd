extends CanvasLayer

# Signals needed.
signal start_game

# Init the game
func _ready() -> void:
	
	# Connect signals of GUI.
	$RulesAndStart/StarButton.connect("pressed", self, "_on_StarButton_pressed")


# Start the game
func _on_StarButton_pressed() -> void:
	# Hide rule panel and start timer.
	$RulesAndStart.hide()
