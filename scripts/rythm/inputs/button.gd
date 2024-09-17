extends Node2D

@export var key: String

@onready var button: Sprite2D = $"."
@onready var timer: Timer = $Timer

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed(key):
		button.frame_coords.x = 1
		timer.start()
		await timer.timeout
		button.frame_coords.x = 0
