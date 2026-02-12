extends State
class_name PlatClimb

var p : CharacterBody2D

func enter():
	p = get_parent().user
	p.frames.play("run")

func update(delta):
	pass

func physics_update(delta):
	if !p.is_on_ladder:
		Transitioned.emit(self, "platfall")
	
	var directionX: float = Input.get_axis("left", "right")
	if directionX:
		p.velocity.x = directionX * p.SPEED
	else:
		p.velocity.x = 0
	var directionY: float = Input.get_axis("up", "down")
	if directionY:
		p.velocity.y = directionY * p.SPEED
	else:
		p.velocity.y = 0
	
func exit():
	pass
	#print("exiting plat climb")
