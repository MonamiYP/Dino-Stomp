extends Node
class_name FiniteStateMachine

var states : Dictionary =  {}
var current_state : State
@export var initial_state : State

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transition.connect(change_state)
	
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.PhysicsUpdate(delta)
		
func change_state(source_state: State, new_state_name:String) -> void:
	if source_state != current_state:
		print("Invalid change_state from: " + source_state.name + ". Currently in: " + current_state.name)
		return
	
	var new_state: State = states.get(new_state_name.to_lower())
	if !new_state:
		print(new_state_name + " not found")
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	
	current_state = new_state
	
	
