extends Node2D

# Precargo la escena de la nota para usarla en el generador.
var noteScene: PackedScene = preload("res://SCENES/LEFT-SIDE/nota.tscn")

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func spawn_note():
	
	# Por ahora de manera random se elige en cual de los 3 carriles se crea
	# la nota, cuando una nota se añade al nodo padre llamado "NOTES".
	
	var random_note_spawn = randi_range(0,2)
	var new_note = noteScene.instantiate()
	
	if random_note_spawn == 0:
		add_child(new_note)
		new_note.position = Vector2(120,-200)
		
	elif random_note_spawn == 1:
		add_child(new_note)
		new_note.position = Vector2(325,-200)
		
	elif random_note_spawn == 2:
		add_child(new_note)
		new_note.position = Vector2(550,-200)
		
