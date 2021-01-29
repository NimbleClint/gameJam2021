extends Area2D

func _on_Cat_body_entered(body):
	print("Passed through cat")

signal cat_collected

func _on_cat_body_entered(body: Node) -> void:
	print("Hit cat")
	if body.is_in_group("player"):
		emit_signal("cat_collected")
		queue_free()
