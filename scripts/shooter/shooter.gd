extends Node

@onready var players: Node2D = $Players
@onready var player: CharacterBody2D = $Players/Player
@export var actual_level: String = "algo"

func character_shoot():
	for p in players.get_children():
		if p.has_method("shoot"):  # Verificamos que el nodo tenga el método `shoot`
			p.shoot()
	
func downgrade():
	for p in players.get_children():
		
		if p.bullets_to_shoot == 5:
			p.bullets_to_shoot -= 1
		else:
			p.bullets_to_shoot -= 1
			if p.bullets_to_shoot == 0:
				p.bullets_to_shoot = 1
	
func upgrade():
	for p in players.get_children():
		p.bullets_to_shoot += 1
		if p.bullets_to_shoot == 6:
			p.bullets_to_shoot = 5
