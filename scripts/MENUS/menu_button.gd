extends TextureButton

@export var text: String
@export var positive: bool = true
var active_sound = true
@onready var label: Label = $CenterContainer/Label

func _ready() -> void:
	label.text = text
	focus_entered.connect(_move)
	pressed.connect(_select)

func _move():
	if active_sound:
		SoundManager.play(SoundManager.CURSOR)

func _select():
	if active_sound:
		SoundManager.play(SoundManager.ACCEPT if positive else SoundManager.CANCEL)
