extends Node2D

# You were here at 20:58
# https://www.youtube.com/watch?v=aPN7k7irDnY&t=125s
const GameOverScreen = preload("res://src/gameOverScreen.tscn")

var score
onready var scorelabel = get_node("CanvasLayer/scoreLabel")
onready var timelabel = get_node("CanvasLayer/timeLabel")
onready var timer = get_node("Timer")
export var time = 180

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

# Countdown and display timer
func _on_Timer_timeout() -> void:
	if(time == 0):
		show_game_over_screen(score)
		return
	time -= 1
	var timeText = "Time: "+String(time)
	timelabel.clear()
	timelabel.add_text(timeText)
	

func show_game_over_screen(s):
	var game_over = GameOverScreen.instance()
	add_child(game_over)
	game_over.update_score(s)
	get_tree().paused = true
