extends CanvasLayer

@onready var resume: Button = $VBoxContainer/Resume

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resume.pressed.connect(_on_resume_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		visible = not visible
		get_tree().paused = visible
		
func _on_resume_pressed() -> void:
	hide()
	get_tree().paused = false
