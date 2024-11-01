extends CharacterBody2D

var speed = 800
var acceleration = 5000
var BulletScene = preload("res://scenes/shooter/characters/bullet.tscn")
var bullets_to_shoot = 1
var duplicated_times = 0

func _physics_process(delta: float) -> void:
	
	#if bullets_to_shoot == 5 and duplicated_times == 0:
		#duplicate_itself()
		#duplicated_times = 1
	
	var move_input = Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, speed * move_input, acceleration * delta)
	move_and_slide()


func shoot():
	if bullets_to_shoot == 1:
		var bullet = BulletScene.instantiate()
		bullet.position.x = position.x
		bullet.position.y = position.y - 10
		get_parent().get_parent().call_deferred("add_child", bullet)
		
	elif bullets_to_shoot == 2:
		var bullet1 = BulletScene.instantiate()
		var bullet2 = BulletScene.instantiate()
		bullet1.position.x = position.x - 10
		bullet1.position.y = position.y - 10
		bullet2.position.x = position.x + 10
		bullet2.position.y = position.y - 10
		get_parent().get_parent().call_deferred("add_child", bullet1)
		get_parent().get_parent().call_deferred("add_child", bullet2)
	
	elif bullets_to_shoot == 3:
		
		var bullet1 = BulletScene.instantiate()
		var bullet2 = BulletScene.instantiate()
		var bullet3 = BulletScene.instantiate()
		bullet1.position.x = position.x - 10
		bullet1.position.y = position.y - 10
		bullet1.angler = 100
		
		bullet2.position.x = position.x
		bullet2.position.y = position.y - 10
		
		bullet3.position.x = position.x + 10
		bullet3.position.y = position.y - 10
		bullet3.angler = 80
		
		get_parent().get_parent().call_deferred("add_child", bullet1)
		get_parent().get_parent().call_deferred("add_child", bullet2)
		get_parent().get_parent().call_deferred("add_child", bullet3)
		
	elif bullets_to_shoot == 4 or bullets_to_shoot == 5:
		var bullet1 = BulletScene.instantiate()
		var bullet2 = BulletScene.instantiate()
		var bullet3 = BulletScene.instantiate()
		var bullet4 = BulletScene.instantiate()
		bullet1.position.x = position.x - 15
		bullet1.position.y = position.y - 10
		bullet1.angler = 100
		
		bullet2.position.x = position.x - 8
		bullet2.position.y = position.y - 10
		
		bullet3.position.x = position.x + 8
		bullet3.position.y = position.y - 10
		
		bullet4.position.x = position.x + 15
		bullet4.position.y = position.y - 10
		bullet4.angler = 80
		
		get_parent().get_parent().call_deferred("add_child", bullet1)
		get_parent().get_parent().call_deferred("add_child", bullet2)
		get_parent().get_parent().call_deferred("add_child", bullet3)
		get_parent().get_parent().call_deferred("add_child", bullet4)
		
	#elif bullets_to_shoot == 5:
		#var bullet1 = BulletScene.instantiate()
		#var bullet2 = BulletScene.instantiate()
		#bullet1.position.x = position.x - 10
		#bullet1.position.y = position.y - 10
		#bullet2.position.x = position.x + 10
		#bullet2.position.y = position.y - 10
		#get_parent().get_parent().call_deferred("add_child", bullet1)
		#get_parent().get_parent().call_deferred("add_child", bullet2)
		
func duplicate_itself():
	var new_ship = self.duplicate()
	new_ship.bullets_to_shoot = 2
	new_ship.duplicated_times = 1
	if position.x > 0:
		new_ship.position += Vector2(-10, 0)
	else:
		new_ship.position += Vector2(10, 0)
	get_parent().add_child(new_ship)
		
		
		
