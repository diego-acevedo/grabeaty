extends Control

@onready var go_to_demo_button: Button = $"VBoxContainer/GO TO DEMO BUTTON"
@onready var credits_button: Button = $"VBoxContainer/CREDITS BUTTON"
@onready var quit_button: Button = $"VBoxContainer/QUIT BUTTON"

var demo_scene: PackedScene = preload("res://scenes/main.tscn")

func _ready() -> void:
	go_to_demo_button.pressed.connect(_on_go_to_demo_pressed)
	credits_button.pressed.connect(_on_credits_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
func _on_go_to_demo_pressed():
	get_tree().change_scene_to_packed(demo_scene)
	
func _on_quit_pressed():
	get_tree().quit()
	
func _on_credits_pressed():
	get_tree().change_scene_to_packed(demo_scene)
