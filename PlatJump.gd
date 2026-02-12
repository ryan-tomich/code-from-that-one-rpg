extends State
class_name PlatJump

var p : CharacterBody2D

func enter():
	p = get_parent().user
	p.frames.play("fall")
	p.velocity.y = p.JUMP_VELOCITY

func update(delta):
	pass

func physics_update(delta):
	if p.is_on_ladder:
		Transitioned.emit(self, "platclimb")
	if (abs(p.velocity.y) < 10):
		Transitioned.emit(self, "platfall")
	if (Input.is_action_just_released("up")):
		Transitioned.emit(self, "platfall")
		
	p.velocity.y += p.gravity * delta
	var direction: float = Input.get_axis("left", "right")
	if direction:
		p.velocity.x = direction * p.SPEED
	else:
		p.velocity.x = 0
	
func exit():
	#print("exiting plat jump")
	p.velocity.y = 0