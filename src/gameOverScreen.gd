extends CanvasLayer

func _on_restartButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://src/level.tscn")


func _on_quitButton_pressed():
	get_tree().quit()

func update_score(score):
	var scoreLabel = get_node("PanelContainer/MarginContainer/rows/scoreLabel")
	scoreLabel.clear()
	scoreLabel.set_fit_content_height(true)
	scoreLabel.append_bbcode("[center]Score: "+String(score))
