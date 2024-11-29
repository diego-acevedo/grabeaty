extends Node2D

@onready var shooter: Node2D = $Shooter
@onready var score_manager: Control = $ScoreManager

func _ready() -> void:
	shooter.player.damage_dealt.connect(score_manager.fail)

func correct_to_shoot():
	shooter.character_shoot()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("EXIT"):
		get_tree().quit()
