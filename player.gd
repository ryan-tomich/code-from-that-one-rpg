extends CharacterBody2D

@onready var frames: AnimatedSprite2D = $AnimatedSprite2D

const SPEED: float = 110.0
const JUMP_VELOCITY: float = -300.0
const CLIMB_SPEED: float = -80.0

var gravity: float = 980.0
var is_on_ladder: bool = false

var movement_sm = null
var interactable_object = null

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") && interactable_object != null:
		interactable_object.action()
		#print("executing interaction")
	move_and_slide()

func set_movement_type(type):
	if (movement_sm != null):
		remove_child(movement_sm)
		movement_sm.queue_free()

	movement_sm = load("res://characters/player/state machines/"+type+"/"+type+".tscn").instantiate()
	add_child(movement_sm)