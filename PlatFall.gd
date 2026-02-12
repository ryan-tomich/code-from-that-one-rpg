extends State
class_name PlatFall

var p : CharacterBody2D

func enter():
	p = get_parent().user
	p.frames.play("fall")

func update(delta):
	pass

func physics_update(delta):
	p.velocity.y += p.gravity * delta
	var direction: float = Input.get_axis("left", "right")
	if direction:
		p.velocity.x = direction * p.SPEED
	else:
		p.velocity.x = 0
		
	if (p.is_on_floor()):
		Transitioned.emit(self, "platidle")
	if (p.is_on_ladder):
		Transitioned.emit(self, "platclimb")
	
func exit():
	pass
	#print("exiting plat fall")
