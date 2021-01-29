extends Node2D

var score

onready var scorelabel = get_node("CanvasLayer/RichTextLabel")

func _ready():
	score = 0

# Function to add one point, called when player collects cat
func addPoint() -> void:
	score = score + 1
	var scoretext = "Score: "+String(score)
	print(scoretext)
	scorelabel.clear()
	scorelabel.add_text(scoretext)

# Function to subtract three points, called when player collects dog
func losePoints() -> void:
	score = score - 3
	if score < 0:
		score = 0
	var scoretext = "Score: "+String(score)
	print(scoretext)
	scorelabel.clear()
	scorelabel.add_text(scoretext)

# Functions for collecting points
func _on_cat_cat_collected() -> void:
	addPoint()

func _on_dog_dog_collected() -> void:
	losePoints()

func _on_cat_rigidcat_collected() -> void:
	addPoint()
