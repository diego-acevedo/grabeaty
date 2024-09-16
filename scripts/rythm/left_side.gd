extends Node2D

func _input(event: InputEvent) -> void:
	
	# Un input para cerrar el juego con tan solo apretar la tecla "ESC".
	
	if event.is_action_pressed("EXIT"):
		get_tree().quit()


func pass_to_main():
	get_parent().correct_to_shoot()
	
