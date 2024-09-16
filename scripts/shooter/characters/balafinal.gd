extends CharacterBody2D

var velocity_y = 0  # Velocidad inicial en el eje Y
var speed = -200  # Velocidad que aplicaremos después
var bullet_speed = 400  # Velocidad de la bala

		
func _physics_process(delta: float) -> void:
	
	if position.y < -10:
		queue_free()
	velocity_y = speed  # Cambia la velocidad en el eje Y
	position.y += velocity_y * delta
