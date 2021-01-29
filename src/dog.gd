extends Area2D

signal dog_collected

func _on_dog_body_entered(body: Node) -> void:
	print("Hit dog")
	if body.is_in_group("player"):
		emit_signal("dog_collected")
		queue_free()
