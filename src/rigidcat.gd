extends RigidBody2D

signal rigidcat_collected

func _on_rigidcat_body_entered(body: Node) -> void:
	print("Hit rigid cat")
	if body.is_in_group("player"):
		emit_signal("rigidcat_collected")
		queue_free()
