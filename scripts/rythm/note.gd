extends Area2D

@onready var circulo_sprite: Sprite2D = $Circulo_Sprite
@onready var score_manager: Control = $"../../../../ScoreManager"

var speed = 200
var miss_count = 0

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	
	if position.y > 450 and miss_count == 0: 
		score_manager.note_miss()
		miss_count = 1
	
	if position.y > 1200:
		queue_free()

func correct():
	
	# Esta funcion se ejecuta cuando la nota ha sido tocada, por lo tanto
	# hago que desaparezca.
	
	get_parent().get_parent().get_parent().pass_to_main() # Nodo MAIN
	queue_free()
	
func changeColor(color):
	if (color == "center"):
		circulo_sprite.set_modulate(Color(0.231, 0.686, 0.722, 1))
	elif (color == "left"):
		circulo_sprite.set_modulate(Color(0.788, 0.341, 0.306, 1))
	elif (color == "right"):
		circulo_sprite.set_modulate(Color(0.804, 0.4, 0.694, 1))
		
		
	
	
	
	
