extends Node2D
@export var destination: String
@export var new_position: Vector2

func action():
	var main: Node = get_tree().root.get_children()[0]
	main.set_world(destination, new_position)

func _on_entry_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.interactable_object = self
		#print("setting io to door (self)")

func _on_entry_area_body_exited(body: Node2D) -> void:
	if body.name == "Player" && body.interactable_object == self:
		body.interactable_object = null
		#print("setting io to null")
