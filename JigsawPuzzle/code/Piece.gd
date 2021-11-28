extends KinematicBody2D

signal onDragAndDrop
signal checkOnDrop
signal pieceOk

var isDragging := false
var pieceName = null

export var finalPosX := 0
export var finalPosY := 0

export var thresholdX := 50
export var thresholdY := 50

func _ready() -> void:
    connect("onDragAndDrop", self, "set_drag_piece")
    connect("checkOnDrop", self, "check_drop_piece")

# Called when an input event is catched.
# Used to know if the user click on a puzzle piece.
func _input_event(viewport: Object, event: InputEvent, shape_idx: int) -> void:

    # If this is a mouse click
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT and event.pressed:
            print(name)
            pieceName = name
            emit_signal("onDragAndDrop")
        if event.button_index == BUTTON_LEFT and !event.pressed:
            emit_signal("checkOnDrop")
    

func _physics_process(delta: float) -> void:
  
    # If the piece is currently held and the user is moving the mouse
    # the piece has to follow the mouse.  
    if isDragging and pieceName == name and input_pickable:
        global_transform.origin = get_global_mouse_position()
        
func set_drag_piece():
    isDragging = !isDragging
    
func check_drop_piece():
    
    isDragging = false
        
    if (pieceName == name) :
        
        var dropX = abs(global_transform.origin.x - finalPosX)
        var dropY = abs(global_transform.origin.y - finalPosY)
        
        if dropX < thresholdX and dropY < thresholdY:
            emit_signal("pieceOk")
            global_transform.origin.x = finalPosX
            global_transform.origin.y = finalPosY
            input_pickable = false
        
