extends CanvasLayer

@onready var resume: Button = $VBoxContainer/Resume
@onready var restart: Button = $VBoxContainer/Restart
@onready var main_menu: Button = $"VBoxContainer/Main Menu"
@onready var quit: Button = $VBoxContainer/Quit
var main_menu_scene: PackedScene = load("res://scenes/MENUS/main_menu.tscn")

func _ready() -> void:
	resume.pressed.connect(_on_resume_pressed)
	restart.pressed.connect(_on_restart_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	quit.pressed.connect(_on_quit_pressed)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		visible = not visible
		get_tree().paused = visible
		
func _on_resume_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_restart_pressed() -> void:
	hide()
	get_tree().paused = false
	get_tree().reload_current_scene()
	
	
func _on_main_menu_pressed() -> void:
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_packed(main_menu_scene)
	
func _on_quit_pressed() -> void:
	get_tree().quit()
