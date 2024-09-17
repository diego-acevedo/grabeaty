extends Area2D

var speed = -500  # Velocidad que aplicaremos después
		
func _physics_process(delta: float) -> void:
	position += transform.y * speed * delta
