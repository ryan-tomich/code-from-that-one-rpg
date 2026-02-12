extends State
class_name PlatRun

var p : CharacterBody2D

func enter():
	p = get_parent().user
	p.frames.play("run")

func update(delta):
	pass

func physics_update(delta):
	var direction: float = Input.get_axis("left", "right")
	if direction:
		p.velocity.x = direction * p.SPEED
	else:
		p.velocity.x = 0

	if !p.is_on_floor():
		Transitioned.emit(self, "platfall")
	if !Input.is_action_pressed("right") and !Input.is_action_pressed("left"):
		Transitioned.emit(self, "platidle")
	if Input.is_action_pressed("up"):
		Transitioned.emit(self, "platjump")
	
func exit():
	#print("exiting plat run")
	pass
