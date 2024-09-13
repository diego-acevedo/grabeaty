extends Node2D

@onready var shooter: Node2D = $Shooter


func correct_to_shoot():
	shooter.character_shoot()
