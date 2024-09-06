extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	
	# Un input para cerrar el juego con tan solo apretar la tecla "ESC".
	
	if event.is_action_pressed("EXIT"):
		get_tree().quit()
