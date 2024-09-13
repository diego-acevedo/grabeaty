extends Node

@onready var right_side: Node2D = $"Right Side"

func _ready() -> void:
	print(right_side)

func correct_to_shoot():
	right_side.shoot_right()
	
