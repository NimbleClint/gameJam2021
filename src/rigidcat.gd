extends RigidBody2D

signal rigidcat_collected

onready var main = self.get_tree().get_current_scene()

func _ready():
	self.connect("rigidcat_collected", main, "_on_rigidcat_rigidcat_collected")

func _on_rigidcat_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		emit_signal("rigidcat_collected")
		queue_free()
		
func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	apply_impulse(Vector2(), Vector2.UP * 5)

func _on_tree_shake_tree():
	apply_impulse(Vector2(), Vector2.UP * 5)
