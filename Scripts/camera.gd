extends Camera2D
@export var character: CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	speed_setup()
	
func speed_setup(): 
	if Input.is_anything_pressed():
		self.position.x = character.velocity.normalized().x * 200
	else: 
		self.position.x = move_toward(self.position.x, 0, 10)
