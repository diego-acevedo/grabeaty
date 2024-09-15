extends Sprite2D

@onready var s_button: Sprite2D = $"."
@onready var timer: Timer = $Timer

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("S"):
		s_button.frame = 3
		timer.start()
		await timer.timeout
		s_button.frame = 2
