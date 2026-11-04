extends Node2D
var parent: CharacterBody2D = get_parent()
const SPEED = 300.0
var time_variable: float = 50
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	horizontal_movement()

func horizontal_movement(): 
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		parent.velocity.x = direction * SPEED
	else:
		#create_tween().tween_property(parent, "velocity", Vector2(move_toward(parent.velocity.x, 0, SPEED), parent.velocity.y), 2)
		#await get_tree().create_timer(0.2).timeout 
		parent.velocity.x = move_toward(parent.velocity.x, time_variable, SPEED)
		while time_variable != 0:
			time_variable -= 10
			await get_tree().create_timer(0.1).timeout
			
