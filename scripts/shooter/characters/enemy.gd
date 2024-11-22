class_name Enemy
extends CharacterBody2D
@export var health = 10
@export var bullet_scene: PackedScene
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
var min_time = 5
var variance = 10

signal dead(unit)

func _ready() -> void:
	scale.y = -1
	timer.timeout.connect(_shoot)
	_set_timer()
	
func _shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.speed = 250
	bullet.position.x = position.x
	bullet.position.y = position.y + 10
	get_parent().call_deferred("add_child", bullet)
	_set_timer()

func _set_timer() -> void:
	timer.start(min_time + (randi() % variance))

func take_damage(amount):
	health = health - amount #daño que le quita
	if health <= 0:
		die()
	else:
		animation_player.play("damage")
		
func die():
	animation_player.play("explosion")
	var t = Timer.new()
	add_child(t)
	t.wait_time = 0.25  # Tiempo de espera (0.2 segundos)
	t.one_shot = true
	t.start()
	t.timeout.connect(_end_of_explosion)

func _end_of_explosion():
	dead.emit(self)
	queue_free()
