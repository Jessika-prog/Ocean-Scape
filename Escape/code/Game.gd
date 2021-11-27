extends Node2D

# Scenes
var intro := preload("res://Escape/Submarine.tscn")
var interior := preload("res://Escape/Interior.tscn")
var spamClicker := preload("res://SpamClicker/SpamClicker.tscn")
var puzzle := preload("res://JigsawPuzzle/PuzzleMain.tscn")

<<<<<<< HEAD
onready var root = get_tree().get_root()

=======
# Instances of scenes.
>>>>>>> 1ebfacdad56db46cf6cb36511bde172609f4b9c5
onready var introScreen := intro.instance()
onready var interiorScreen := interior.instance()
onready var spamClickerScreen := spamClicker.instance()
onready var puzzleScreen := puzzle.instance()

func _ready() -> void:
	
<<<<<<< HEAD
	$Screen.add_child(introScreen)
	introScreen.get_node("Discover").connect("pressed", self, "goDiscover")
	
	interiorScreen.get_node("GoPuzzle").connect("pressed", self, "goPuzzle")

=======
	# Init screen.
	$Screen.add_child(introScreen)
	
	# Button to load interior screen.
	introScreen.get_node("Discover").connect("pressed", self, "goDiscover")
	
	# Button helping to play mini-game on interior screen.
	interiorScreen.get_node("GoPuzzle").connect("pressed", self, "goPuzzle")
	interiorScreen.get_node("GoSpamClicker").connect("pressed", self, "goSpamClicker")
	
	# Button helping returning on interior screen.
	spamClickerScreen.get_node("IMH/Result/Return").connect("pressed", self, "goDiscover")

# Go to interior screen.
>>>>>>> 1ebfacdad56db46cf6cb36511bde172609f4b9c5
func goDiscover() -> void:
	cleanScreen()
	$Screen.add_child(interiorScreen)
	
<<<<<<< HEAD
=======
# Play SpamClicker game.
>>>>>>> 1ebfacdad56db46cf6cb36511bde172609f4b9c5
func goSpamClicker() -> void:
	cleanScreen()
	$Screen.add_child(spamClickerScreen)
	
<<<<<<< HEAD
func goPuzzle() -> void:
	cleanScreen()
	$Screen.add_child(puzzleScreen)
	
func cleanScreen() -> void:
	var screen := $Screen.get_child(0)
	$Screen.remove_child(screen)
	screen.queue_free()
=======
# Play puzzle game.
func goPuzzle() -> void:
	cleanScreen()
	$Screen.add_child(puzzleScreen)

# Remove screen to load a new one.
func cleanScreen() -> void:
	var screen := $Screen.get_child(0)
	$Screen.remove_child(screen)
>>>>>>> 1ebfacdad56db46cf6cb36511bde172609f4b9c5
