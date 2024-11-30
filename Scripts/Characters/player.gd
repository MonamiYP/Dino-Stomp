extends CharacterBody3D

#@export var speed = 5
#@export var fall_acceleration = 75
#
#@onready var animation = $"Pivot/Stegosaurus/AnimationPlayer"

#var target_velocity = Vector3.ZERO
#
#func _physics_process(delta: float) -> void:
	#get_input()
	#
	#if velocity != Vector3.ZERO:
		#velocity = velocity.normalized() * speed
		#$Pivot.basis = Basis.looking_at(velocity)
#
	#if not is_on_floor():
		#velocity.y = velocity.y - (fall_acceleration * delta)
	#
	#if velocity.x || velocity.z:
		#animation.play("rig|Walk", -1, 6.0)
	#else:
		#animation.play("rig|Idle_001")
		#
	#move_and_slide()
#
func _physics_process(delta: float) -> void:
	move_and_slide()
