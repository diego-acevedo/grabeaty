extends CharacterBody2D

var velocity_y = 0  # Velocidad inicial en el eje X
var speed = -200  # Velocidad que aplicaremos después
var bullet_speed = 400  # Velocidad de la bala

		
func _process(delta):
	velocity_y = speed  # Cambia la velocidad en el eje X
	position.y += velocity_y * delta
