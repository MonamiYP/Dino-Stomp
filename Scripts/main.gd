extends Node3D

var ray_origin : Vector3
var ray_target : Vector3

func _physics_process(_delta: float) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	
	ray_origin = $CameraPivot/Camera3D.project_ray_origin(mouse_position)
	ray_target = ray_origin + $CameraPivot/Camera3D.project_ray_normal(mouse_position) * 1000
	
	var space_state : PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
	var query : PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(ray_origin, ray_target)
	query.collide_with_areas = true
	var intersection : Dictionary = space_state.intersect_ray(query)
	
	if not intersection.is_empty():
		var pos : Vector3 = intersection.position
		var look_at : Vector3 = Vector3(pos.x, $Player/Pivot/FiringMouth.position.y, pos.z)
		$Player/Pivot/FiringMouth.look_at(look_at, Vector3.UP)
