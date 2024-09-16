extends CharacterBody2D

var speed = 600
var acceleration = 1500
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
var BulletScene = preload("res://scenes/shooter/characters/balafinal.tscn")
@onready var player: CharacterBody2D = $"."

func _physics_process(delta: float) -> void:
	
	var move_input = Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, speed * move_input, acceleration * delta)
	move_and_slide()


func shoot():
	velocity.y = 0
	print("you shot")
	var bullet_instance = BulletScene.instantiate()
	bullet_instance.position.x = position.x
	bullet_instance.position.y = position.y - 10
	get_parent().add_child(bullet_instance)
	if position.y < -10:
		queue_free()
