extends CanvasLayer

@onready var retrybutton: Button = $retrybutton
@onready var quitbutton: Button = $quitbutton
@onready var score: Label = $VBoxContainer/SCORE
@onready var score_node: Control = $"../ScoreManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	retrybutton.pressed.connect(on_retry_pressed)
	quitbutton.pressed.connect(on_quit_pressed)
	
func on_retry_pressed():
	hide()
	get_tree().paused = false
	get_tree().reload_current_scene()

func on_quit_pressed():
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MENUS/main_menu.tscn")
	
func ejecutar():
	score.text = "SCORE: " + str(score_node.score)
	visible = not visible
	get_tree().paused = visible
	
	
