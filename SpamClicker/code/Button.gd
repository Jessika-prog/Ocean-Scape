extends Area2D

signal purge

# Purge ocean from CO2
func _input_event(viewport: Object, event: InputEvent, shape_idx: int) -> void:
	
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			emit_signal("purge")

