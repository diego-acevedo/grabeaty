extends CharacterBody2D

var speed = 600
var acceleration = 1500

func _physics_process(delta: float) -> void:
	
	var move_input = Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, speed * move_input, acceleration * delta)
	
	move_and_slide()
