extends CharacterBody2D

var speed = 800
var acceleration = 5000
var BulletScene = preload("res://scenes/shooter/characters/bullets/bullet.tscn")
var RocketScene = preload("res://scenes/shooter/characters/bullets/rocket.tscn")
var DroneScene = preload("res://scenes/shooter/characters/bullets/drone.tscn")
var bullets_to_shoot = 1
var drones = []

@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal damage_dealt

func _ready() -> void:
	drones = []

func _physics_process(delta: float) -> void:
	
	var move_input = Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, speed * move_input, acceleration * delta)
	move_and_slide()

func shoot():
	if bullets_to_shoot == 1:
		deactivate_drones()
		var bullet = BulletScene.instantiate()
		bullet.position.x = position.x
		bullet.position.y = position.y - 10
		get_parent().get_parent().call_deferred("add_child", bullet)
		
	elif bullets_to_shoot == 2:
		deactivate_drones()
		var bullet1 = BulletScene.instantiate()
		var bullet2 = BulletScene.instantiate()
		bullet1.position.x = position.x - 10
		bullet1.position.y = position.y - 10
		bullet2.position.x = position.x + 10
		bullet2.position.y = position.y - 10
		get_parent().get_parent().call_deferred("add_child", bullet1)
		get_parent().get_parent().call_deferred("add_child", bullet2)
	
	elif bullets_to_shoot == 3:
		deactivate_drones()
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
		
	elif bullets_to_shoot == 4:
		deactivate_drones()
		var rocket = RocketScene.instantiate()
		rocket.position.x = position.x
		rocket.position.y = position.y - 10
		
		get_parent().get_parent().call_deferred("add_child", rocket)
		
	elif bullets_to_shoot == 5:
		var rocket = RocketScene.instantiate()
		rocket.position.x = position.x
		rocket.position.y = position.y - 10
		
		get_parent().get_parent().call_deferred("add_child", rocket)
		
		var drone_left = DroneScene.instantiate()
		drone_left.main_ship = self
		drone_left.offset_position = Vector2(-50, 10)
		get_tree().current_scene.add_child(drone_left)
		drones.append(drone_left)
		
		var bullet1 = BulletScene.instantiate()
		bullet1.position.x = position.x - 25
		bullet1.position.y = position.y
		get_parent().get_parent().call_deferred("add_child", bullet1)

		
		var drone_right = DroneScene.instantiate()
		drone_right.main_ship = self
		drone_right.offset_position = Vector2(50, 10)
		get_tree().current_scene.add_child(drone_right)
		drones.append(drone_right)
		
		var bullet2 = BulletScene.instantiate()
		bullet2.position.x = position.x + 25
		bullet2.position.y = position.y
		get_parent().get_parent().call_deferred("add_child", bullet2)
		
func deactivate_drones():
	for drone in drones:
		drone.queue_free()
	drones.clear()

func take_damage(_damage):
	animation_player.play("damage")
	damage_dealt.emit()
