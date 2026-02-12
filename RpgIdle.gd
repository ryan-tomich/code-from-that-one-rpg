extends State
class_name RpgIdle

var p : CharacterBody2D

func enter():
	p = get_parent().user
	p.frames.play("idle")
	p.velocity = Vector2.ZERO

func update(delta):
	pass

func physics_update(delta):
	if Input.is_action_pressed("right") or Input.is_action_pressed("left") or Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		Transitioned.emit(self, "rpgrun")
	
func exit():
	#print("exiting idle")
	pass
