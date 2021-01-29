# Script from github.com/MitchReidNZ/Godot-Interaction-Example

extends StaticBody2D

var shook := false
var spawnPosition
export var spawnDog := true
signal shake_tree

func _ready():
	var spawnNode = get_node("spawnLoc")
	spawnPosition = spawnNode.global_position

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player

func interaction_get_text() -> String:
	return "Shake"

func interaction_interact(interactionComponentParent : Node) -> void:
	if shook:
		return
	shook = true
	var scene
	if(spawnDog):
		scene = load("res://src/rigiddog.tscn")
	else:
		scene = load("res://src/rigidcat.tscn")
	var spawn = scene.instance()
	#spawn.set_pos(spawnPosition)
	add_child(spawn)
	print("shook a tree")

	# Remove from interaction layer
	collision_layer = collision_layer ^ 4
