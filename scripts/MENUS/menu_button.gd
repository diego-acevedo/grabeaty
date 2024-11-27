extends TextureButton

@export var text: String
@onready var label: Label = $CenterContainer/Label

func _ready() -> void:
	label.text = text
	focus_entered.connect(_move)
	pressed.connect(_accept)

func _move():
	SoundManager.play(SoundManager.CURSOR)

func _accept():
	SoundManager.play(SoundManager.ACCEPT)
