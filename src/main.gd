extends Node2D

var score = 0

onready var scorelabel = get_node("CanvasLayer/RichTextLabel")

func _on_cat_cat_collected() -> void:
	score += 1
	var scoretext = "Score: "+String(score)
	print(scoretext)
	scorelabel.clear()
	scorelabel.add_text(scoretext)
