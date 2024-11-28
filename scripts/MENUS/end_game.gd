extends CanvasLayer

@onready var title: Label = $VBoxContainer/Title
@onready var restart: TextureButton = $VBoxContainer/HBoxContainer/Restart
@onready var main_menu: TextureButton = $"VBoxContainer/HBoxContainer/Main Menu"
@onready var score: Label = $VBoxContainer/VBoxContainer/Score

@export var handle: String

var info = null

func _ready() -> void:
	restart.active_sound = false
	restart.grab_focus()
	restart.active_sound = true
	info = StaticData.read(StaticData.levels)[handle]

func set_values(new_score: int):
	var victory = new_score >= info.min_score
	title.text = 'VICTORY' if victory else 'GAME OVER'
	title.label_settings.font_color = '#0a6071' if victory else '#90312c'
	restart.label.text = 'Play Again' if victory else 'Try Again'
	main_menu.label.text = 'Next Level' if victory else 'Go Back'
	score.text = "%d/%d" % [new_score, info.min_score]

func activate():
	visible = true
	restart.active_sound = false
	restart.grab_focus()
	restart.active_sound = true
