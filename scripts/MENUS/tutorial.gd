extends Control

@onready var menu: TextureButton = $MenuButton
var menus: PackedScene = preload("res://scenes/MENUS/main_menu.tscn")

func _ready() -> void:
	menu.active_sound = false
	menu.grab_focus()
	menu.active_sound = true
	menu.pressed.connect(_on_menu_pressed)
	
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MENUS/main_menu.tscn")
