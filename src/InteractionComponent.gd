# Script from github.com/MitchReidNZ/Godot-Interaction-Example

extends Area2D

export var interaction_parent : NodePath
onready var animator = get_node("../../AnimationPlayer")

signal on_interactable_changed(newInteractable)

var interaction_target : Node

# Called every frame
func _process(_delta):
	# Check whether the player is trying to interact
	if (interaction_target != null and Input.is_action_just_pressed("interact")):
		# If so, we'll call interaction_interact() if our target supports it
		if (interaction_target.has_method("interaction_interact")):
			interaction_target.interaction_interact(self)


# Signal triggered when our collider collides with something on the interaction layer
func _on_InteractionComponent_body_entered(body):
	if(body.shook):
		return
	# Store the thing we'll be interacting with, so we can trigger it from _process
	interaction_target = body
	emit_signal("on_interactable_changed", interaction_target)


func _on_InteractionComponent_body_exited(body):
	if (body == interaction_target):
		interaction_target = null
		emit_signal("on_interactable_changed", null)
