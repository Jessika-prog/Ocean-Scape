extends CanvasLayer

signal changeScreen

func _ready() -> void:
	
	# Run animations
	$PoissonAnim.play("Anim")
	$SogefishAnim.play("Anim")
	
	$Megot1Anim.play("Anim")
	$Megot2Anim.play("Anim")
	$Megot3Anim.play("Anim")
	$BouteillesAnim.play("Anim")
	$WasteAnim.play("Anim")
	
	# Connect button signal.
	$Ready.connect("pressed", self, "_on_ReadyButton_pressed")
	$Discover.connect("pressed", self, "_on_DiscoverButton_pressed")
	
func _on_ReadyButton_pressed() -> void:
	$Intro.hide()
	$Ready.hide()
	$Discover.show()

func _on_DiscoverButton_pressed() -> void:
	emit_signal("changeScreen")
