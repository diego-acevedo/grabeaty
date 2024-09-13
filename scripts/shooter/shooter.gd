extends Node

@onready var player: CharacterBody2D = $Player

func character_shoot():
	player.shoot()
