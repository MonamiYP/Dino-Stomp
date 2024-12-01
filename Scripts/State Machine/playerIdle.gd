extends State
class_name PlayerIdle

@export var sprite : Node3D
@onready var animation : AnimationPlayer = sprite.find_child("AnimationPlayer")

@export var player : CharacterBody3D


func Update(_delta:float) -> void:
	animation.play("rig|Idle_001")
	if(Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")):
		state_transition.emit(self, "Walk")
	if(Input.is_action_just_pressed("attack")):
		pass
