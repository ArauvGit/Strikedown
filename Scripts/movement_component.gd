extends Node2D
var parent: CharacterBody2D = get_parent()
var SPEED = 300.0
var JUMP_VELOCITY = -400.0

var can_jump: bool = false 
var can_land: bool = false
var can_move: bool = false
var time_variable: float = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	horizontal_movement(delta) 
	if not parent.is_on_floor(): 
		can_land = true 
		can_jump = false
	if parent.is_on_floor() and can_land: 
		squish(Vector2(1.2, 0.8))
	if can_jump:
		vertical_movement()
	if can_move: 
		horizontal_movement(delta)
func squish(squish_value: Vector2): 
	can_land = false
	create_tween().tween_property(parent, "scale", squish_value, 0.1)
	await get_tree().create_timer(0.1).timeout
	create_tween().tween_property(parent, "scale", Vector2(1, 1), 0.1)

func horizontal_movement(delta_time: float): 
	var direction := Input.get_axis("game_move_left", "game_move_right") #keep like this for now, adjust when introducing enemies
	if direction:
		parent.velocity.x = direction * SPEED
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, (SPEED / 25))
func vertical_movement(): 
	if parent.is_on_floor(): 
		parent.velocity.y = JUMP_VELOCITY


func trigger(input: Variant) -> void:
	print(input)
	match input: 
		var x when x == "game_jump": 
			can_jump = true
		var x when x == "game_move_left" or x == "game_move_right": 
			can_move = true
