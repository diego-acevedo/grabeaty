extends Area2D

@onready var note_sprite: Sprite2D = $NoteSprite
@onready var score_manager: Control = $"../../../../ScoreManager"

var speed = 200
var miss_count = 0

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	
	if position.y > 450 and miss_count == 0: 
		score_manager.note_miss()
		miss_count = 1
	
	if position.y > 500:
		queue_free()

func correct():
	
	# Esta funcion se ejecuta cuando la nota ha sido tocada, por lo tanto
	# hago que desaparezca.
	
	get_parent().get_parent().get_parent().pass_to_main() # Nodo MAIN
	queue_free()
	
func changeColor(color):
	if (color == "center"):
		note_sprite.frame_coords.x = 5
	elif (color == "left"):
		note_sprite.frame_coords.x = 4
	elif (color == "right"):
		note_sprite.frame_coords.x = 7
		
		
	
	
	
	
