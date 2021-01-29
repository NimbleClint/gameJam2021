# Script from github.com/MitchReidNZ/Godot-Interaction-Example

extends StaticBody2D

var shook := false
export var shakes := 3
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
		print("no can shake")
		return
	if(shakes > 0):
		shakes = shakes - 1
		print("Remaining shakes: "+String(shakes))
	if (shakes == 0):
		shook = true
		print("No more remaining shakes")
		# Remove from interaction layer
		collision_layer = collision_layer ^ 4
	var scene
	if(spawnDog):
		scene = load("res://src/rigiddog.tscn")
	else:
		scene = load("res://src/rigidcat.tscn")
	var spawn = scene.instance()
	add_child(spawn)
	emit_signal("shake_tree")
	print("shook a tree")


func _on_tree_shake_tree() -> void:
	pass # Replace with function body.
