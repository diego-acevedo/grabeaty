extends Node2D

@export var key: String
@export var color: Color

@onready var sprite: Sprite2D = $Sprite
@onready var colision: CollisionShape2D = $"Pressed Area/Colision"
@onready var timer: Timer = $"Pressed Area/Colision/Timer"

func _ready() -> void:
	modulate = color

func _input(event: InputEvent) -> void:
	
	# Cuando presionamos la tecla "key" queremos aplicar la colision, mostrar el 
	# sprite y activar el temporizador de cuanto tiempo estara prendida la 
	# colision. Cuando se acabe entonces la colision y el sprite vuelven a 
	# desaparecer.
	
	if event.is_action_pressed(key):
		colision.disabled = false
		sprite.visible = true
		timer.start()
		await timer.timeout
		colision.disabled = true
		sprite.visible = false

func _on_key_area_entered(area: Area2D) -> void:
	
	# Utilizo esta señal para evaluar cuando una nota ha sido tocada, en caso
	# positivo entonces llamamos a la funcion "die" de la nota lo que hace que
	# desaparezca.
	
	if area.has_method("correct"):
		area.correct()
