extends Sprite2D

@onready var a_button: Sprite2D = $"."
@onready var timer: Timer = $Timer

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("D"):
		a_button.frame = 5
		timer.start()
		await timer.timeout
		a_button.frame = 4
