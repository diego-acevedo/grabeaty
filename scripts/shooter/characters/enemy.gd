class_name Enemy
extends CharacterBody2D
@export var health = 10
@onready var animation_player: AnimationPlayer = $Spritesheet/AnimationPlayer

signal dead(unit)

func _ready() -> void:
	scale.y = -1
	

func take_damage(amount):
	health = health - amount #daño que le quita
	if health <= 0:
		die()
		
func die():
	dead.emit(self)
	animation_player.play("explosion")
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.25  # Tiempo de espera (0.2 segundos)
	timer.one_shot = true
	timer.start()
	timer.timeout.connect(func(): queue_free())
