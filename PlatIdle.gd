extends State
class_name PlatIdle

var p : CharacterBody2D

func enter():
	p = get_parent().user
	p.frames.play("idle")
	p.velocity = Vector2.ZERO

func update(delta):
	pass

func physics_update(delta):
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		Transitioned.emit(self, "platrun")
	if Input.is_action_pressed("up"):
		Transitioned.emit(self, "platjump")
	
func exit():
	#print("exiting plat idle")
	pass
