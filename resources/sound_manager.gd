extends Node

@export var CURSOR: AudioStreamWAV
@export var ACCEPT: AudioStreamWAV
@export var CANCEL: AudioStreamWAV

func play(stream: AudioStream):
	var player = AudioStreamPlayer.new()
	#player.bus = "SFX"
	player.stream = stream
	add_child(player)
	player.finished.connect(player.queue_free)
	player.play()
