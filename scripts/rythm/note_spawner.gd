extends Node2D

# IMPORTANTE: UNA NOTA DEMORA 2 SEGUNDOS EN LLEGAR A LA ZONA DONDE DEBE SER TOCADA

@onready var song: AudioStreamPlayer = $FirstSong
const note_scene = preload("res://scenes/rythm/nota.tscn")
@onready var notes_node: Node2D = $NOTES


# Diccionario con la info de en que momento deben aparecer y que tipo son las notas
var notes_data = {
	
	2.06: "right",  
	3.06: "left", 
	4.06: "center",
	5.06: "left",  
	5.41: "left",
	5.77: "center",
	
	6.06: "left",
	6.56: "left",
	7.06: "center",
	7.56: "center",
	8.06: "right",
	8.56: "right",
	9.06: "left",  
	9.41: "left",
	9.77: "center",
	10.06: "right",
	10.56: "right",
	11.06: "center",
	11.56: "center",
	12.06: "left",
	12.56: "left",
	13.06: "right",  
	13.41: "right",
	13.77: "center",
	
	14.06: "left",
	14.56: "right",
	15.06: "left",
	15.34: "center",
	15.54: "left",
	15.74: "center",
	
	16.06: "right",
	16.56: "left",
	17.06: "right",
	17.34: "center",
	17.54: "right",
	17.74: "center",
	
	18.06: "left",
	18.56: "right",
	19.06: "left",
	19.34: "center",
	19.54: "left",
	19.74: "center",
	
	20.06: "right",
	20.56: "left",
	21.06: "right",
	21.34: "center",
	21.54: "right",
	21.74: "center"
	
}

# diccionario de notas que ya han aparecido, evita bugs de duplicacion de notas
var processed_keys = []

func _ready() -> void:
	song.play()
	
func _process(delta: float) -> void:
	
	# En cada tick veo en que momento de la cancion estamos y comparo ese momento
	# con los del diccionario con una aproximacion de valor absoluto, HAY QUE
	# OPTIMIZARLO.
	
	var song_time = song.get_playback_position()
	for key in notes_data.keys():
		if key not in processed_keys and abs(song_time - key) < 0.1:
			var note_type = notes_data[key]
			spawn_note(note_type)
			processed_keys.append(key)
		
		
# Funcion que spawnea una nota dependiendo de la pos en la que debe aparecer, 
# es decir ("left", "right" o "center")
func spawn_note(note_type: String) -> void:
	var note_instance = note_scene.instantiate()
	notes_node.add_child(note_instance)
	if note_type == 'left':
		note_instance.position = Vector2(193, 0)
		
	elif note_type == 'center':
		note_instance.position = Vector2(331, 0)
		
	elif note_type == 'right':
		note_instance.position = Vector2(469, 0)
		
	
	
		

		
	
