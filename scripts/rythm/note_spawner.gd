extends Node2D

# IMPORTANTE: UNA NOTA DEMORA 2 SEGUNDOS EN LLEGAR A LA ZONA DONDE DEBE SER TOCADA

@onready var song: AudioStreamPlayer = $FirstSong
const note_scene = preload("res://scenes/rythm/note.tscn")
@onready var notes_node: Node2D = $Notes

@onready var time_label: Label = $TimeLabel

# Diccionario con la info de en que momento deben aparecer y que tipo son las notas
var notes_data = {
	
	2.00: "left", 
	2.32: "center",
	2.72: "center",
	3.46: "right",
	3.70: "left",
	
	3.90: "right",
	4.26: "center",
	4.63: "left",
	
	5.84: "right", 
	6.16: "center",
	6.56: "center", 
	7.30: "left",
	7.54: "right",
	
	7.78: "left", 
	8.10: "center",
	8.50: "center",
	9.24: "right",
	9.48: "left",
	
	9.70: "center", 
	10.02: "center",
	10.42: "center", 
	10.90: "center",
	
	11.40: "left",
	11.52: "center",
	11.64: "right",
	11.76: "center",
	
	12.12: "center",
	12.37: "right",
	12.49: "center",
	13.10: "center",
	13.34: "right",
	
	13.57: "left", 
	13.89: "center",
	14.29: "center",
	15.03: "right",
	15.27: "left",
	
	15.51: "right", 
	15.83: "center",
	16.23: "center",
	16.97: "left",
	17.21: "right",
	
	17.45: "left", 
	17.78: "center",
	18.18: "center",
	
	18.65: "right",
	18.78: "center",
	18.90: "left",
	19.14: "center",
	
	19.63: "left",
	19.86: "right",
	20.83: "center",

	21.32: "left", 
	21.64: "center",
	22.04: "center",
	22.78: "right",
	23.02: "left",
	
	23.25: "right", 
	23.57: "center",
	23.97: "center",
	24.71: "right",
	24.95: "left",
	
	25.19: "right", 
	25.51: "center",
	25.91: "center",
	
	26.40: "left",
	26.53: "center",
	26.65: "right",
	26.89: "center",
	
	27.13: "right", 
	27.35: "center",
	27.60: "center",
	28.57: "left",
	
	29.06: "right", 
	29.38: "center",
	29.78: "center",
	30.52: "left",
	30.76: "right",
	
	31.00: "left", 
	31.32: "center",
	31.72: "center",
	32.46: "right",
	32.70: "left",
	
	32.93: "right", 
	33.25: "center",
	33.65: "center",
	34.39: "left",
	34.63: "right",
	
	34.87: "left",
	35.19: "center",
	35.59: "center",
	36.33: "left",
	36.57: "right",
	
	36.80: "center", 
	37.12: "right",
	37.52: "right",
	38.26: "left",
	38.50: "center",
	
	38.74: "left", 
	39.06: "center",
	39.46: "center",
	40.20: "right",
	40.44: "left",
	
	40.68: "center", 
	41.00: "left",
	41.40: "left",
	41.90: "right",
	42.38: "center",
	42.48: "right",
	
	42.61: "center", 
	43.10: "left",
	43.29: "center",
	43.46: "right",
	44.30: "center",
	
	44.55: "left", 
	44.87: "left",
	45.27: "center",
	46.01: "right",
	46.25: "right",
	
	46.48: "center", 
	46.80: "left",
	47.20: "left",
	47.94: "right",
	48.18: "center",
	
	48.42: "right",
	48.74: "center",
	49.14: "left",
	
	49.63: "center",
	49.76: "left",
	49.88: "center",
	50.11: "left",
	50.36: "center",
	50.60: "left",
	50.84: "left",
	51.80: "right",
	
	52.29: "center", 
	52.61: "right",
	53.01: "right",
	53.75: "center",
	53.99: "left",
	
	54.22: "right", 
	54.54: "left",
	54.94: "left",
	55.68: "center",
	55.92: "right",
	
	56.16: "center",
	56.48: "left",
	56.88: "right",
	
	57.37: "left",
	57.49: "center",
	57.62: "right",
	57.85: "center",
	
	58.11: "center",
	58.34: "right",
	58.58: "right",
	58.83: "left",
	59.55: "center",
	
	# TECNO
	
	60.04: "left",
	61.00: "right",
	61.73: "center",
	61.97: "left",
	62.11: "right",
	
	63.90: "left",
	64.87: "right",
	65.61: "left",
	65.71: "right",
	65.84: "center",
	65.98: "left",
	
	67.77: "center",
	68.74: "left",
	69.47: "right",
	69.57: "center",
	69.70: "left",
	69.84: "center",
	
	71.64: "left",
	72.61: "right",
	73.34: "left",
	73.44: "center",
	73.57: "right",
	73.71: "center",
	
	75.52: "right",
	76.48: "center",
	77.21: "right",
	77.31: "center",
	77.44: "left",
	77.58: "center",
	
	79.39: "left",
	80.36: "right",
	80.60: "left",
	80.72: "center",
	80.84: "right",
	81.08: "center",
	81.56: "left",
	81.80: "right",
	
	83.26: "center",
	84.22: "right",
	84.96: "left",
	85.06: "center",
	85.19: "right",
	85.33: "center",
	
	87.13: "center",
	88.10: "center",
	88.34: "right",
	88.46: "center",
	88.58: "left",
	88.82: "center",
	89.30: "left",
	89.55: "right",
	90.39: "center"
	
}

# diccionario de notas que ya han aparecido, evita bugs de duplicacion de notas
var processed_keys = []

func _ready() -> void:
	song.play()
	
func _process(_delta: float) -> void:
	
	# En cada tick veo en que momento de la cancion estamos y comparo ese momento
	# con los del diccionario con una aproximacion de valor absoluto, HAY QUE
	# OPTIMIZARLO.
	
	var song_time = song.get_playback_position()
	time_label.text = str(round(song_time))
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
		note_instance.changeColor("left")
		note_instance.position = Vector2(-46, 0)
		
		
	elif note_type == 'center':
		note_instance.changeColor("center")
		note_instance.position = Vector2(0, 0)
		
		
	elif note_type == 'right':
		note_instance.changeColor("right")
		note_instance.position = Vector2(46, 0)
		
		
	
	
		

		
	
