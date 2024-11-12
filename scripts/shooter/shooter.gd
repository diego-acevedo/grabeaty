extends Node

@onready var players: Node2D = $Players

func character_shoot():
	for player in players.get_children():
		if player.has_method("shoot"):  # Verificamos que el nodo tenga el método `shoot`
			player.shoot()
	
func downgrade():
	for player in players.get_children():
		
		if player.bullets_to_shoot == 5:
			player.bullets_to_shoot -= 1
		else:
			player.bullets_to_shoot -= 1
			if player.bullets_to_shoot == 0:
				player.bullets_to_shoot = 1
	
func upgrade():
	for player in players.get_children():
		player.bullets_to_shoot += 1
		if player.bullets_to_shoot == 6:
			player.bullets_to_shoot = 5
