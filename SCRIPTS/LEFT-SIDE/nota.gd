extends Area2D

var speed = 200

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	
	if position.y > 1200:
		queue_free()

func correct():
	
	# Esta funcion se ejecuta cuando la nota ha sido tocada, por lo tanto
	# hago que desaparezca.
	
	Intermediary.correct_to_shoot()
	queue_free()
