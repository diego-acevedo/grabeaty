extends Node2D

# IMPORTANTE: UNA NOTA DEMORA 2 SEGUNDOS EN LLEGAR A LA ZONA DONDE DEBE SER TOCADA

@onready var song: AudioStreamPlayer = $LevelSong
const note_scene = preload("res://scenes/rythm/note.tscn")
@onready var notes_node: Node2D = $Notes
@onready var shooter: Node2D = $"../../Shooter"
@onready var enemy_spawner: Node2D = $"../../Shooter/EnemiesGenerator"
@onready var time_label: Label = $TimeLabel
@onready var timer: Timer = $BossNode/Timer

@onready var boss = preload("res://scenes/shooter/characters/enemies/boss.tscn")
var boss_instance: Node = null
@onready var boss_node: Node2D = $BossNode
@onready var rythm_node: Node2D = $".."

signal finish_level
# Diccionario con la info de en que momento deben aparecer y que tipo son las notas
var first_level = {
	
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

var second_level = {
	
	0.8: "left", 
	1.03: "center",
	1.26: "center",
	1.50: "right",
	1.73: "left",
	1.86: "center",
	2.09: "center",
	2.20: "left",
	2.44: "center",
	
	2.68: "left",
	2.91: "center",
	3.14: "center",
	3.38: "right",
	3.61: "left",
	3.74: "center",
	3.97: "center",
	4.08: "left",
	4.32: "center",
	
	4.55: "left",
	4.78: "center",
	5.01: "center",
	5.25: "right",
	5.48: "left",
	5.61: "center",
	5.84: "center",
	5.95: "left",
	6.19: "center",
	
	6.42: "left",
	6.65: "center",
	6.88: "center",
	7.12: "right",
	7.35: "left",
	7.48: "center",
	7.71: "center",
	7.82: "left",
	8.06: "center",
	
	8.29: "left",
	8.52: "center",
	8.75: "center",
	8.99: "right",
	9.22: "left",
	9.35: "center",
	9.58: "center",
	9.69: "left",
	9.93: "center",
	
	10.16: "left",
	10.39: "center",
	10.62: "center",
	10.86: "right",
	11.09: "left",
	11.22: "center",
	11.45: "center",
	11.56: "left",
	11.80: "center",
	
	12.03: "left",
	12.26: "center",
	12.49: "center",
	12.73: "right",
	12.96: "left",
	13.09: "center",
	13.32: "center",
	13.43: "left",
	13.67: "center",
	
	13.90: "left",
	14.13: "center",
	14.36: "center",
	14.60: "right",
	14.83: "left",
	14.96: "center",
	15.19: "center",
	15.30: "left",
	15.54: "center",
	
	# CAMBIO
	
	15.80: "left",
	16.04: "center",
	16.26: "center",
	16.50: "right",
	16.73: "center",
	16.97: "center",
	17.20: "left",
	
	17.68: "left",
	17.91: "center",
	18.13: "center",
	18.37: "right",
	18.60: "center",
	18.84: "center",
	19.07: "left",
	
	19.55: "left",
	19.78: "center",
	20.00: "center",
	20.24: "right",
	20.47: "center",
	20.71: "center",
	20.94: "left",
	
	21.18: "right",
	
	21.42: "left",
	21.65: "center",
	21.87: "center",
	22.11: "right",
	22.34: "center",
	22.58: "center",
	22.81: "left",
	
	23.07: "center",
	
	23.29: "left",
	23.52: "center", 
	23.74: "center",
	23.98: "right",
	24.21: "center",
	24.45: "center",
	24.68: "left",
	
	25.16: "left",
	25.39: "center",
	25.61: "center",
	25.85: "right",
	26.08: "center",
	26.32: "center",
	26.55: "left",
	
	27.03: "left",
	27.26: "center",
	27.48: "center",
	27.72: "right",
	27.95: "center",
	28.19: "center",
	28.42: "left",
	28.70: "center",
	28.94: "center",
	
	#DROP
	30.80: "left",
	31.27: "center",
	31.42: "center",
	31.74: "center",
	31.87: "center",
	32.10: "center",
	32.33: "right",
	32.46: "center",
	32.82: "center",
	32.92: "center",
	33.15: "center",
	33.39: "center",
	33.51: "center",
	33.75: "left",
	33.98: "center",
	34.19: "center",
	34.33: "center",
	
	34.55: "right",
	35.02: "center",
	35.17: "center",
	35.49: "center",
	35.62: "center",
	35.85: "center",
	36.08: "left",
	36.21: "center",
	36.57: "center",
	36.67: "center",
	36.90: "center",
	37.14: "center",
	37.26: "center",
	37.50: "right",
	37.73: "center",
	37.94: "center",
	38.08: "center",
	
	38.30: "left",
	38.77: "center",
	38.92: "center",
	39.24: "center",
	39.37: "center",
	39.60: "center",
	39.83: "right",
	39.96: "center",
	40.32: "center",
	40.42: "center",
	40.65: "center",
	40.89: "center",
	41.01: "center",
	41.25: "left",
	41.48: "center",
	41.69: "center",
	41.83: "center",
	
	42.05: "left",
	42.52: "center",
	42.67: "center",
	42.99: "center",
	43.12: "center",
	43.35: "center",
	43.58: "right",
	43.71: "center",
	44.07: "center",
	44.17: "center",
	44.40: "center",
	44.64: "center",
	44.76: "center",
	45.00: "left",
	45.23: "center",
	45.44: "center",
	45.58: "center",
	
	45.80: "left",
	46.27: "center",
	46.42: "center",
	46.74: "center",
	46.87: "center",
	47.10: "center",
	47.33: "right",
	47.46: "center",
	47.82: "center",
	47.92: "center",
	48.15: "center",
	48.39: "center",
	48.51: "center",
	48.75: "left",
	48.98: "center",
	49.19: "center",
	49.33: "center",
	
	49.55: "left",
	50.02: "center",
	50.17: "center",
	50.49: "center",
	50.62: "center",
	50.85: "center",
	51.08: "right",
	51.21: "center",
	51.57: "center",
	51.67: "center",
	51.90: "center",
	52.14: "center",
	52.26: "center",
	52.50: "left",
	52.73: "center",
	52.94: "center",
	53.08: "center",
	
	53.30: "left",
	53.77: "center",
	53.92: "center",
	54.24: "center",
	54.37: "center",
	54.60: "center",
	54.83: "right",
	54.96: "center",
	55.32: "center",
	55.42: "center",
	55.65: "center",
	55.89: "center",
	56.01: "center",
	56.25: "left",
	56.48: "center",
	56.69: "center",
	56.83: "center",
	
	57.05: "left",
	57.52: "center",
	57.67: "center",
	57.99: "center",
	58.12: "center",
	58.35: "center",
	58.58: "right",
	58.71: "center",
	59.07: "center",
	59.17: "center",
	59.40: "center",
	59.64: "center",
	59.76: "center",
	60.00: "left",
	60.23: "center",
	60.44: "center",
	60.58: "center",
	
	60.80: "left",
	61.27: "center",
	61.42: "center",
	61.74: "center",
	61.87: "center",
	62.10: "center",
	62.33: "right",
	62.46: "center",
	62.82: "center",
	62.92: "center",
	63.15: "center",
	63.39: "center",
	63.51: "center",
	63.75: "left",
	63.98: "center",
	64.19: "center",
	64.33: "center",
	
	64.55: "left",
	65.02: "center",
	65.17: "center",
	65.49: "center",
	65.62: "center",
	65.85: "center",
	66.08: "right",
	66.21: "center",
	66.57: "center",
	66.67: "center",
	66.90: "center",
	67.14: "center",
	67.26: "center",
	67.50: "left",
	67.73: "center",
	67.94: "center",
	68.08: "center",
	
	68.30: "left",
	68.77: "center",
	68.92: "center",
	69.24: "center",
	69.37: "center",
	69.60: "center",
	69.83: "right",
	69.96: "center",
	70.32: "center",
	70.42: "center",
	70.65: "center",
	70.89: "center",
	71.01: "center",
	71.25: "left",
	71.48: "center",
	71.69: "center",
	71.83: "center",
	
	72.05: "left",
	72.52: "center",
	72.67: "center",
	72.99: "center",
	73.12: "center",
	73.35: "center",
	73.58: "right",
	73.71: "center",
	74.07: "center",
	74.17: "center",
	74.40: "center",
	74.64: "center",
	74.76: "center",
	75.00: "left",
	75.23: "center",
	75.44: "center",
	75.58: "center",
	
	# CAMBIO
	75.80: "left",
	76.04: "center",
	76.26: "center",
	76.50: "right",
	76.73: "center",
	76.97: "center",
	77.20: "left",

	77.68: "left",
	77.91: "center",
	78.13: "center",
	78.37: "right",
	78.60: "center",
	78.84: "center",
	79.07: "left",

	79.55: "left",
	79.78: "center",
	80.00: "center",
	80.24: "right",
	80.47: "center",
	80.71: "center",
	80.94: "left",

	81.18: "right",

	81.42: "left",
	81.65: "center",
	81.87: "center",
	82.11: "right",
	82.34: "center",
	82.58: "center",
	82.81: "left",

	83.07: "center",

	83.29: "left",
	83.52: "center",
	83.74: "center",
	83.98: "right",
	84.21: "center",
	84.45: "center",
	84.68: "left",

	85.16: "left",
	85.39: "center",
	85.61: "center",
	85.85: "right",
	86.08: "center",
	86.32: "center",
	86.55: "left",

	87.03: "left",
	87.26: "center",
	87.48: "center",
	87.72: "right",
	87.95: "center",
	88.19: "center",
	88.42: "left",
	88.70: "center",
	88.94: "center",
	
	89.18: "left",
	89.41: "center",
	89.64: "center",
	89.87: "right",
	90.10: "center",
	90.35: "center",
	90.59: "center",
	
	# CAMBIO
	90.85: "center",
	91.07: "center",
	91.19: "center",
	91.76: "right",
	91.97: "left",
	92.09: "center",
	92.25: "right",
	
	92.70: "center",
	92.92: "center",
	93.04: "center",
	93.61: "center",
	93.82: "left",
	93.94: "center",
	94.10: "right",
	94.22: "center",
	
	94.55: "center",
	94.77: "center",
	94.89: "center",
	95.46: "right",
	95.67: "left",
	95.79: "center",
	95.95: "right",
	
	96.40: "center",
	96.62: "center",
	96.74: "center",
	97.40: "center",
	97.50: "center",
	97.60: "right",
	97.70: "left",
	97.80: "center",
	97.90: "right",
	98.10: "center",
	
	# 2
	
	98.4: "center",
	98.62: "center",
	98.74: "center",
	99.31: "right",
	99.52: "left",
	99.64: "center",
	99.80: "right",
	100.25: "center",
	100.47: "center",
	100.59: "center",
	101.16: "center",
	101.37: "left",
	101.49: "center",
	101.65: "right",
	101.77: "center",
	102.10: "center",
	102.32: "center",
	102.44: "center",
	103.01: "right",
	103.22: "left",
	103.34: "center",
	103.50: "right",
	103.95: "center",
	104.17: "center",
	104.29: "center",
	104.95: "center",
	105.05: "center",
	105.15: "right",
	105.25: "left",
	105.35: "center",
	105.45: "right",
	105.65: "center",
	
	# CAMBIO
	
	105.90:"center",
	106.17:"center",
	106.52:"center",
	106.87:"center",
	107.22:"center",
	107.46:"center",
	107.69:"left",
	108.04:"left",
	108.40:"left",
	108.75:"left",
	109.10:"left",
	109.33:"left",
	109.57:"right",
	109.92:"right",
	110.27:"right",
	110.62:"right",
	110.97:"right",
	111.21:"right",
	111.44:"center",
	111.79:"center",
	112.14:"center",
	112.50:"center",
	112.85:"center",
	113.09:"center",
	113.32:"left",
	113.79:"center",
	114.25:"right",
	114.72:"center",
	115.19:"left",
	115.66:"center",
	116.13:"right",
	116.60:"center",
	
	#FINAL DROP
	
	120.8: "left",
	121.27: "center",
	121.42: "center",
	121.74: "center",
	121.87: "center",
	122.1: "center",
	122.33: "right",
	122.46: "center",
	122.82: "center",
	122.92: "center",
	123.15: "center",
	123.39: "center",
	123.50: "center",
	123.75: "left",
	123.97: "center",
	124.19: "center",
	124.33: "center",
	124.55: "right",
	125.02: "center",
	125.17: "center",
	125.49: "center",
	125.62: "center",
	125.85: "center",
	126.08: "left",
	126.21: "center",
	126.57: "center",
	126.67: "center",
	126.9: "center",
	127.14: "center",
	127.25: "center",
	127.5: "right",
	127.72: "center",
	127.94: "center",
	128.07: "center",
	128.3: "left",
	128.77: "center",
	128.92: "center",
	129.24: "center",
	129.37: "center",
	129.6: "center",
	129.82: "right",
	129.96: "center",
	130.32: "center",
	130.42: "center",
	130.65: "center",
	130.89: "center",
	131.01: "center",
	131.25: "left",
	131.48: "center",
	131.69: "center",
	131.82: "center",
	132.05: "left",
	132.52: "center",
	132.67: "center",
	132.99: "center",
	133.12: "center",
	133.35: "center",
	133.57: "right",
	133.71: "center",
	134.07: "center",
	134.17: "center",
	134.4: "center",
	134.64: "center",
	134.76: "center",
	135.0: "left",
	135.23: "center",
	135.44: "center",
	135.57: "center",
	135.8: "left",
	136.27: "center",
	136.42: "center",
	136.74: "center",
	136.87: "center",
	137.1: "center",
	137.32: "right",
	137.46: "center",
	137.82: "center",
	137.92: "center",
	138.15: "center",
	138.39: "center",
	138.51: "center",
	138.75: "left",
	138.98: "center",
	139.19: "center",
	139.32: "center",
	139.55: "left",
	140.02: "center",
	140.17: "center",
	140.49: "center",
	140.62: "center",
	140.85: "center",
	141.07: "right",
	141.21: "center",
	141.57: "center",
	141.67: "center",
	141.9: "center",
	142.14: "center",
	142.26: "center",
	142.5: "left",
	142.73: "center",
	142.94: "center",
	143.07: "center",
	143.3: "left",
	143.77: "center",
	143.92: "center",
	144.24: "center",
	144.37: "center",
	144.6: "center",
	144.82: "right",
	144.96: "center",
	145.32: "center",
	145.42: "center",
	145.65: "center",
	145.89: "center",
	146.01: "center",
	146.25: "left",
	146.48: "center",
	146.69: "center",
	146.82: "center",
	147.05: "left",
	147.52: "center",
	147.67: "center",
	147.99: "center",
	148.12: "center",
	148.35: "center",
	148.57: "right",
	148.71: "center",
	149.07: "center",
	149.17: "center",
	149.4: "center",
	149.64: "center",
	149.76: "center",
	150.0: "center",
	150.23: "left",
	150.35: "center",
	150.47: "right",
	150.59: "center",
	150.70: "left",
	150.85: "right",
	
}

var tutorial = {}

var notes_data

# diccionario de notas que ya han aparecido, evita bugs de duplicacion de notas
var processed_keys = []

func _ready() -> void:
	song.finished.connect(finish_level.emit)
	notes_data = first_level if shooter.actual_level == "Level 1" else second_level if shooter.actual_level == "Level 2" else tutorial
	
func _process(_delta: float) -> void:
	
	# En cada tick veo en que momento de la cancion estamos y comparo ese momento
	# con los del diccionario con una aproximacion de valor absoluto, HAY QUE
	# OPTIMIZARLO.
	
	var song_time = song.get_playback_position()
	
	if shooter.actual_level == "Level 2":
		if abs(song_time - 30) < 0.1:
			enemy_spawner.visible = false
			
		if abs(song_time - 31) < 0.1 and boss_instance == null:
			spawn_boss()
		
		if abs(song_time - 76) < 0.1 and boss_instance != null:
			despawn_boss()
		
		if abs(song_time - 78) < 0.1:
			enemy_spawner.visible = true
			
		if abs(song_time - 118) < 0.1:
			enemy_spawner.visible = false
		
		if abs(song_time - 120) < 0.1 and boss_instance == null:
			spawn_boss()
			
		if abs(song_time - 153) < 0.1 and boss_instance != null:
			despawn_boss()
	
	if boss_instance != null:
		boss_instance.check_attack(song_time)
	
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
		
		
func spawn_boss():
	boss_instance = boss.instantiate()
	boss_node.add_child(boss_instance)
	boss_node.position = Vector2(320,300)
	boss_node.scale.x = 0.1
	boss_node.scale.y = 0.1

func despawn_boss():
	var boss_node_new = boss_node.get_child(0)
	boss_instance = null
	boss_node_new.anim_player.play("Despawn")
	timer.start()
	await timer.timeout
	boss_node_new.queue_free()
func dead_boss():
	var boss_node_new = boss_node.get_child(0)
	boss_node_new.anim_player.play("Despawn")
	
	
	
	
	
		

		
	
