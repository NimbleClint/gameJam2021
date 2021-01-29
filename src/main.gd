extends Node2D

var score

onready var scorelabel = get_node("CanvasLayer/scoreLabel")
onready var timelabel = get_node("CanvasLayer/timeLabel")
onready var timer = get_node("Timer")
var displayTime = 60

func _ready():
	score = 0
	timer.set_wait_time(1)
	timer.start()


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
func _on_rigidcat_rigidcat_collected() -> void:
	addPoint()

func _on_rigiddog_rigiddog_collected() -> void:
	losePoints()


func _on_Timer_timeout() -> void:
	displayTime -= 1
	var timeText = "Time: "+String(displayTime)
	print(String(timeText))
	timelabel.clear()
	timelabel.add_text(timeText)
