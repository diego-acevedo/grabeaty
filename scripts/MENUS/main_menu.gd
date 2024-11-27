extends Control

@onready var credits_button: TextureButton = $VBoxContainer/VBoxContainer/CREDITS
@onready var quit_button: TextureButton = $VBoxContainer/VBoxContainer/QUIT
@onready var levels: TextureButton = $VBoxContainer/VBoxContainer/LEVELS

var demo_scene: PackedScene = preload("res://scenes/main.tscn")
const LEVEL_MENU = preload("res://scenes/MENUS/level_selector/level_menu.tscn")
func _ready() -> void:
	levels.active_sound = false
	levels.grab_focus()
	levels.active_sound = true
	levels.pressed.connect(_on_levels_pressed)
	credits_button.pressed.connect(_on_credits_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
func _on_levels_pressed():
	get_tree().change_scene_to_packed(LEVEL_MENU)
	
func _on_quit_pressed():
	get_tree().quit()
	
func _on_credits_pressed():
	get_tree().change_scene_to_packed(demo_scene)
