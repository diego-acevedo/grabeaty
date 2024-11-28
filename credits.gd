extends Control
@onready var movable_container: Control = $MovableContainer
@onready var menu: Button = $menu
var menus: PackedScene = preload("res://scenes/MENUS/main_menu.tscn")

var animation_speed = 80  # Velocidad en píxeles por segundo
var target_position = -1350  # Posición final del desplazamiento
var initial_position = 600  # Posición inicial (fuera de la pantalla)
var is_scrolling = true  # Variable para controlar el movimiento

func _ready():
	# Configurar la posición inicial
	movable_container.position.y = initial_position
	menu.pressed.connect(_on_menu_pressed)
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MENUS/main_menu.tscn")
	
func _process(delta):
	if is_scrolling:
		# Desplazar el contenedor hacia arriba
		movable_container.position.y -= animation_speed * delta

		# Detener el desplazamiento al alcanzar la posición objetivo
		if movable_container.position.y <= target_position:
			is_scrolling = false
			movable_container.position.y = target_position  # Asegurarse de que quede exacto
