extends RigidBody2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func die():
	
	# Esta funcion se ejecuta cuando la nota ha sido tocada, por lo tanto
	# hago que desaparezca.
	
	queue_free()
