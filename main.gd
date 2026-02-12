extends Node2D

@export var player: PackedScene = preload("res://characters/player/player.tscn")
@export var starting_scene: PackedScene = preload("res://areas/test_area.tscn")

func _ready() -> void:
	get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_VIEWPORT
	get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP
	add_child(player.instantiate())
	set_world(starting_scene)


func set_world(target, player_position = null) -> void:
	if ($World.get_child_count() != 0):
		var current_world = $World.get_children()[0]
		$World.remove_child(current_world)
		current_world.queue_free()
	
	var new_world: Node
	if target is String:
		new_world = load("res://areas/" + target + ".tscn").instantiate()
	elif target is PackedScene:
		new_world = target.instantiate()
	elif target is Node:
		new_world = target
	
	$World.add_child(new_world)
	
	if player_position == null:
		player_position = new_world.default_position
	
	$Player.position = player_position
	$Player.set_movement_type(new_world.default_movement_type)


"""
On Cutscenes:

You set a trigger for the scene (can be a collision, or some condition which
is checked every so often in some script)

Create a script whose sole purpose is to play the scene.
The script will have access to all the objects that are relevant to the
scene (camera, player objects, NPC objects, etc), and it will order them
around via signals, tweens and coroutines.

When the trigger is activated, the scene script is launched (either a signal
is sent to it, or it is instantiated), and the player/camera controls are
disabled (if needed).

The script will play and at the end will return the control to the player
before it is disabled/deleted.
"""