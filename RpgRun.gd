extends State
class_name RpgRun

var p : CharacterBody2D

func enter():
	p = get_parent().user
	p.frames.play("run")

func update(delta):
	var directionX := Input.get_axis("left", "right")
	var directionY := Input.get_axis("up", "down")
	if directionX:
		p.velocity.x = directionX * p.SPEED
	else:
		p.velocity.x = move_toward(p.velocity.x, 0, p.SPEED)
	if directionY:
		p.velocity.y = directionY * p.SPEED
	else:
		p.velocity.y = move_toward(p.velocity.y, 0, p.SPEED)

func physics_update(delta):
	if !Input.is_action_pressed("left") and !Input.is_action_pressed("right") and !Input.is_action_pressed("up") and !Input.is_action_pressed("down"):
		Transitioned.emit(self, "rpgidle")
	
func exit():
	#print("exiting run")
	pass
