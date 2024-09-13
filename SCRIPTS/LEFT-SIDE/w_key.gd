extends Node2D

@onready var colision: CollisionShape2D = $key/Colision
@onready var timer: Timer = $key/Colision/Timer
@onready var sprite: Sprite2D = $sprite

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	
	# Cuando presionamos la tecla "W" queremos aplicar la colision, mostrar el 
	# sprite y activar el temporizador de cuanto tiempo estara prendida la 
	# colision. Cuando se acabe entonces la colision y el sprite vuelven a 
	# desaparecer.
	
	if event.is_action_pressed("W-key"):
		colision.set_deferred("disabled", false)
		sprite.visible = true
		timer.start()
		await timer.timeout
		colision.set_deferred("disabled", true)
		sprite.visible = false
		

func _on_key_area_entered(area: Area2D) -> void:
	
	# Utilizo esta señal para evaluar cuando una nota ha sido tocada, en caso
	# positivo entonces llamamos a la funcion "die" de la nota lo que hace que
	# desaparezca.
	
	if area.has_method("die"):
		area.die()
