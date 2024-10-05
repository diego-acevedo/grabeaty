extends CharacterBody2D

var speed = 800
var acceleration = 5000
var BulletScene = preload("res://scenes/shooter/characters/bullet.tscn")

func _physics_process(delta: float) -> void:
	
	var move_input = Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, speed * move_input, acceleration * delta)
	move_and_slide()


func shoot():
		
	var bullet = BulletScene.instantiate()
	bullet.position.x = position.x
	bullet.position.y = position.y - 10
	
	owner.call_deferred("add_child", bullet)
