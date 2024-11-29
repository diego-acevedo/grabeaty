extends Node

@export var CURSOR: AudioStreamWAV
@export var ACCEPT: AudioStreamWAV
@export var CANCEL: AudioStreamWAV
@onready var menu: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	menu.finished.connect(_finished_song)
	
func play(stream: AudioStream):
	var player = AudioStreamPlayer.new()
	player.bus = "sfx"
	player.stream = stream
	add_child(player)
	player.finished.connect(player.queue_free)
	player.play()
	
func _finished_song():
	menu.play(0)
