extends StaticBody2D

func action():
	$glow2.visible = true
	#print("...")
	#print("I'm a pillar")
	get_tree().root.get_children()[2].talk("") # replace "" with conversation 

func _on_interaction_range_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.interactable_object = self

func _on_interaction_range_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.interactable_object = null