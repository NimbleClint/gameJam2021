extends RigidBody2D

signal rigiddog_collected

func _on_rigiddog_body_entered(body: Node) -> void:
	print("Hit rigid dog")
	if body.is_in_group("player"):
		emit_signal("rigiddog_collected")
		queue_free()
