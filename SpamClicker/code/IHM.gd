extends CanvasLayer

# Signals needed.
signal dead
signal victory
signal start_game

# Variables to tweek
export var increaseOverTime := 1
export var initCO2 := 50.0

# Init the game
func _ready() -> void:
    $CO2Bar.value = initCO2
    
    # Get Purge button node and connect signal needed.
    var purgeNode = get_tree().get_root().find_node("Button", true, false)
    purgeNode.connect("purge", self, "_on_Button_purge")
    
    # Connect signals of GUI.
    $RulesAndStart/StarButton.connect("pressed", self, "_on_StarButton_pressed")
    $CO2IncreaseTimer.connect("timeout", self, "_on_CO2IncreaseTimer_timeout")
    
    connect("victory", self, "_on_victory")
    
    # Hide result panel.
    $Result.hide()

# Timeout reach on timer.
func _on_CO2IncreaseTimer_timeout() -> void:
    # Increase value of progress bar.
    $CO2Bar.value += increaseOverTime

# Start the game
func _on_StarButton_pressed() -> void:
    # Hide rule panel and start timer.
    $RulesAndStart.hide()
    $CO2IncreaseTimer.start()

# User press hardly purge button.
func _on_Button_purge() -> void:
    # Decrease progress bar value
    $CO2Bar.value -= 1
    if $CO2Bar.value == 0:
        emit_signal("victory")

# Victory of user    
func _on_victory() -> void:
    $CO2IncreaseTimer.stop()
    $Result.show()
    $Result/Label.text = "GAGNE"
    $Result/Return.show()

# Death of user
func _on_dead() -> void:
    $CO2IncreaseTimer.stop()
    $Result.show()
    $Result/Label.text = "PERDU"
    $Result/Return.show()
