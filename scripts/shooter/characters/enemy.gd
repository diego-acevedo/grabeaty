class_name Enemy
extends CharacterBody2D
var health = 20

func _ready() -> void:
	add_to_group("enemies") #asegurarse que se añadan al grupo de enemigos
	scale.y = -1
	

func take_damage(amount):
	health = health - amount #daño que le quita
	if health <= 0:
		die()

func die():
	queue_free()  # Desaparecer la escena de la bala cuando el enemigo no tenga vida
