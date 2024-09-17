extends CharacterBody2D

var speed = -200  # Velocidad que aplicaremos después

func _ready() -> void:
	velocity.y = speed

		
func _physics_process(_delta: float) -> void:
	
	if position.y < -10:
		queue_free()
