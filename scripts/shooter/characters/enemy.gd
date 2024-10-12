class_name Enemy
extends CharacterBody2D
var health = 20

signal dead(unit)

func _ready() -> void:
	scale.y = -1
	

func take_damage(amount):
	health = health - amount #daño que le quita
	if health <= 0:
		die()

func die():
	dead.emit(self)
	queue_free()  # Desaparecer la escena de la bala cuando el enemigo no tenga vida
