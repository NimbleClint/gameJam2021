extends RigidBody2D

signal rigiddog_collected

onready var main = self.get_tree().get_current_scene()

func _ready():
	self.connect("rigiddog_collected", main, "_on_rigiddog_rigiddog_collected")

func _on_rigiddog_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		emit_signal("rigiddog_collected")
		queue_free()
		
func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	apply_impulse(Vector2(), Vector2.UP * 5)

func _on_tree_shake_tree():
	apply_impulse(Vector2(), Vector2.UP * 5)
