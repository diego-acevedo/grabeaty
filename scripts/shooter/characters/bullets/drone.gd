extends Node2D

var offset_position: Vector2 = Vector2(-50, 10)

# Variable para la nave principal a la que debe seguir
var main_ship: Node2D

func _physics_process(_delta: float) -> void:
	if main_ship:
		# Actualizar la posición del dron en relación con la nave principal
		global_position = main_ship.global_position + offset_position
