extends Node2D

@onready var menu: TextureButton = $Node2D/MenuButton

func _ready():
	# Configurar la posición inicial
	menu.pressed.connect(_on_menu_pressed)
	
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MENUS/main_menu.tscn")
