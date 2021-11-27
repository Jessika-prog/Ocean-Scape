extends Node2D

# Scenes
var intro := preload("res://Escape/Submarine.tscn")
var interior := preload("res://Escape/Interior.tscn")
var spamClicker := preload("res://SpamClicker/SpamClicker.tscn")
var puzzle := preload("res://JigsawPuzzle/PuzzleMain.tscn")

onready var root = get_tree().get_root()

onready var introScreen := intro.instance()
onready var interiorScreen := interior.instance()
onready var spamClickerScreen := spamClicker.instance()
onready var puzzleScreen := puzzle.instance()

func _ready() -> void:
    
    $Screen.add_child(introScreen)
    introScreen.get_node("Discover").connect("pressed", self, "goDiscover")
    
    interiorScreen.get_node("GoPuzzle").connect("pressed", self, "goPuzzle")

func goDiscover() -> void:
    cleanScreen()
    $Screen.add_child(interiorScreen)
    
func goSpamClicker() -> void:
    cleanScreen()
    $Screen.add_child(spamClickerScreen)
    
func goPuzzle() -> void:
    cleanScreen()
    $Screen.add_child(puzzleScreen)
    
func cleanScreen() -> void:
    var screen := $Screen.get_child(0)
    $Screen.remove_child(screen)
    screen.queue_free()
