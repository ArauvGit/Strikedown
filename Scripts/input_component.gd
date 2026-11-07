extends Node2D
signal input_pressed(input)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	var custom_actions = InputMap.get_actions().filter(func(action): return action.contains("game"))
	var test_for_event = func(action): return InputMap.action_has_event(action, event)
	if custom_actions.any(test_for_event): 
		input_pressed.emit(custom_actions.filter(test_for_event)[0])
