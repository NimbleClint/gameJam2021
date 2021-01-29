# Script from github.com/MitchReidNZ/Godot-Interaction-Example

extends StaticBody2D

var shook := false

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player

func interaction_get_text() -> String:
	return "Shake"

func interaction_interact(interactionComponentParent : Node) -> void:
	if shook:
		return
	shook = true
	print("shook a tree")

	# Remove from interaction layer
	collision_layer = collision_layer ^ 4
