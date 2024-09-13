extends Node

@onready var character: CharacterBody2D = get_node("MAIN/Right Side/character")

func correct_to_shoot():
	character.shoot()
	
