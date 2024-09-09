extends Node2D

@onready var a: Sprite2D = $A
@onready var s: Sprite2D = $S
@onready var d: Sprite2D = $D


func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("Q-key"):
		a.frame = 1
	else:
		a.frame = 0
		
	if Input.is_action_pressed("W-key"):
		s.frame = 3
	else:
		s.frame = 2
		
	if Input.is_action_pressed("E-key"):
		d.frame = 5
	else:
		d.frame = 4
