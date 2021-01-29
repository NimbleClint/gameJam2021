# Script from github.com/MitchReidNZ/Godot-Interaction-Example

extends StaticBody2D

var shook := false

signal shake_tree

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player

func interaction_get_text() -> String:
	return "Shake"

func interaction_interact(interactionComponentParent : Node) -> void:
	if shook:
		return
	shook = true
	var scene = load("res://src/rigidcat.tscn")
	var cat = scene.instance()
	add_child(cat)
	print("shook a tree")

	# Remove from interaction layer
	collision_layer = collision_layer ^ 4
