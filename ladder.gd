extends Node2D

func _on_ladder_body_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.is_on_ladder = true
		
func _on_ladder_body_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.is_on_ladder = false
