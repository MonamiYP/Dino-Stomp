extends CharacterBody3D

@export var Projectile : PackedScene

@onready var projectileTimer : Timer = $ProjectileTimer

var projectile_speed : float = 5.0
var sec_between_shot : float = 0.2
var can_shoot : bool = true

func _ready() -> void:
	projectileTimer.wait_time = sec_between_shot

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("attack")):
		shoot()

func shoot() -> void:
	if can_shoot:
		var new_projectile : Node3D = Projectile.instantiate()
		new_projectile.global_transform = $Pivot/FiringMouth.global_transform
		new_projectile.speed = projectile_speed
		var scene_root : Node3D = get_tree().get_root().get_children()[0]
		scene_root.add_child(new_projectile)
		
		can_shoot = false
		projectileTimer.start()

func _on_projectile_timer_timeout() -> void:
	can_shoot = true
