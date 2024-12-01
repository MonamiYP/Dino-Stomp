extends Node3D

var speed : float = 3.0

const KILL_TIME : float = 5.0
var timer : float = 0.0

func _physics_process(delta: float) -> void:
	var forward_direction: Vector3 = -global_transform.basis.z.normalized()
	global_translate(forward_direction * speed * delta)
	
	timer += delta
	if timer > KILL_TIME:
		queue_free()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name != "Player":
		queue_free()
