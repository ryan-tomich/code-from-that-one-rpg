extends Area2D

@export var respawn_point: Vector2

func _on_body_entered(body):
	if (body.name == "Player"):
		# ideally would be last spawn in point, but im too lazy for that
		body.position = respawn_point