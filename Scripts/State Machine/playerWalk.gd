extends State
class_name PlayerWalk

@export var speed = 3

@export var sprite : Node3D
@onready var animation = sprite.find_child("AnimationPlayer")

@export var player : CharacterBody3D

func Update(_delta:float):
	if(player.velocity == Vector3.ZERO):
		state_transition.emit(self, "idle")
	if(Input.is_action_just_pressed("attack")):
		pass

func PhysicsUpdate(_delta:float):
	get_input()
	if player.velocity != Vector3.ZERO:
		player.velocity = player.velocity.normalized() * speed
		$"../../Pivot".basis = Basis.looking_at(player.velocity)
	animation.play("rig|Walk", -1, 6.0)
	player.move_and_slide()

func get_input():
	var input = Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	player.velocity.x = input.x
	player.velocity.z = input.y