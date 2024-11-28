extends Node2D
@onready var bullets: Node2D = $Bullets

@export var bullet_scene: PackedScene
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var anim_player2: AnimationPlayer = $AnimationPlayer2
@onready var timer: Timer = $Bullets/Timer

var health = 10000
var boss_attacks = {
	34: "Main",
	36: "leftArm",
	38: "Main",
	39.92: "rightArm",
	42: "Main",
	43.60: "leftArm",
	46: "Main",
	47.3: "rightArm",
	49.6: "Main",
	51.05: "leftArm",
	52.3: "Main",
	54.80: "rightArm",
	56: "Main",
	58.53: "leftArm",
	60: "Main",
	62.30: "rightArm",
	64: "Main",
	66: "leftArm",
	67.8: "Main",
	69.80: "rightArm",
	71: "Main",
	73.5: "leftArm",
	76.5: "Main",
	
	#PART 2
	
	122: "leftArm",
	124: "Main",
	126: "leftArm",
	128: "Main",
	129.92000000000002: "rightArm",
	132: "Main",
	133.6: "leftArm",
	136: "Main",
	137.3: "rightArm",
	139.6: "Main",
	141.05: "leftArm",
	142.3: "Main",
	144.8: "rightArm",
	146: "Main",
	148.53: "leftArm",
	150: "Main",
	152.3: "rightArm",
	154: "Main",
	156: "leftArm",
	157.8: "Main",
	159.8: "rightArm",
	161: "Main",
	163.5: "leftArm",
	166.5: "Main",
}

var processed_attacks = []

func _ready() -> void:
	anim_player.play("Entrance")
	anim_player.animation_finished.connect(_on_entrance_finished)

func take_damage(amount):
	health = health - amount #daño que le quita
	print(health)
	if health <= 0:
		die()
	else:
		anim_player2.play("damage")
		
func play(animation:String ):
	anim_player.play(animation)
	anim_player.animation_finished.connect(_on_attack_finished)
	
func attack(attack_type):
	if attack_type == "rightArm":
		play("Attack_Right")
		RightAttack()
	elif attack_type == "leftArm":
		play("Attack_Left")
		LeftAttack()
	elif attack_type == "Main":
		play("Attack_Main")
		MainAttack()
		
func check_attack(song_time):
	for key in boss_attacks.keys():
		if key not in processed_attacks and abs(song_time - key) < 0.1:
			var attack_type = boss_attacks[key]
			attack(attack_type)
			processed_attacks.append(key)
	
func _on_entrance_finished(anim_name):
	if anim_name == "Entrance":
		anim_player.animation_finished.disconnect(_on_entrance_finished)
		anim_player.play("IDLE")
	
func _on_attack_finished(anim_name):
	if anim_name == "Attack_Main" or anim_name == "Attack_Right" or anim_name == "Attack_Left":
		anim_player.animation_finished.disconnect(_on_attack_finished)
		anim_player.play("IDLE")
	
func die():
	pass

func MainAttack():
	timer.wait_time = 0.6
	timer.start()
	await timer.timeout
	
	var bullet = bullet_scene.instantiate()
	bullet.speed = 300
	bullet.position.x = position.x + 22
	bullet.position.y = position.y - 51
	bullet.direction = Vector2(-cos(deg_to_rad(103)), sin(deg_to_rad(103))).normalized()
	bullets.add_child(bullet)
	var bulleti = bullet_scene.instantiate()
	bulleti.speed = 300
	bulleti.position.x = position.x - 22
	bulleti.position.y = position.y - 51
	bulleti.direction = Vector2(-cos(deg_to_rad(77)), sin(deg_to_rad(77))).normalized()
	bullets.add_child(bulleti)
	
	timer.wait_time = 0.3
	
	timer.start()
	await timer.timeout
	
	var bullet2 = bullet_scene.instantiate()
	bullet2.speed = 300
	bullet2.position.x = position.x + 22
	bullet2.position.y = position.y - 51
	bullet2.direction = Vector2(-cos(deg_to_rad(103)), sin(deg_to_rad(103))).normalized()
	bullets.add_child(bullet2)
	var bulleti2 = bullet_scene.instantiate()
	bulleti2.speed = 300
	bulleti2.position.x = position.x - 22
	bulleti2.position.y = position.y - 51
	bulleti2.direction = Vector2(-cos(deg_to_rad(77)), sin(deg_to_rad(77))).normalized()
	bullets.add_child(bulleti2)
	
	timer.start()
	await timer.timeout
	var bullet3 = bullet_scene.instantiate()
	bullet3.speed = 300
	bullet3.position.x = position.x + 22
	bullet3.position.y = position.y - 51
	bullet3.direction = Vector2(-cos(deg_to_rad(103)), sin(deg_to_rad(103))).normalized()
	bullets.add_child(bullet3)
	var bulleti3 = bullet_scene.instantiate()
	bulleti3.speed = 300
	bulleti3.position.x = position.x - 22
	bulleti3.position.y = position.y - 51
	bulleti3.direction = Vector2(-cos(deg_to_rad(77)), sin(deg_to_rad(77))).normalized()
	bullets.add_child(bulleti3)

func LeftAttack():
	timer.wait_time = 0.6
	timer.start()
	await timer.timeout
	
	var bullet = bullet_scene.instantiate()
	bullet.speed = 500
	bullet.position.x = position.x - 70
	bullet.position.y = position.y - 56
	bullet.direction = Vector2(-cos(deg_to_rad(90)), sin(deg_to_rad(90))).normalized()
	bullets.add_child(bullet)
	
	timer.wait_time = 0.2
	
	timer.start()
	await timer.timeout
	
	var bullet2 = bullet_scene.instantiate()
	bullet2.speed = 500
	bullet2.position.x = position.x - 45
	bullet2.position.y = position.y - 51
	bullet2.direction = Vector2(-cos(deg_to_rad(100)), sin(deg_to_rad(100))).normalized()
	bullets.add_child(bullet2)
	
	timer.start()
	await timer.timeout
	var bullet3 = bullet_scene.instantiate()
	bullet3.speed = 500
	bullet3.position.x = position.x - 45
	bullet3.position.y = position.y - 51
	bullet3.direction = Vector2(-cos(deg_to_rad(124)), sin(deg_to_rad(124))).normalized()
	bullets.add_child(bullet3)

func RightAttack():
	timer.wait_time = 0.6
	timer.start()
	await timer.timeout
	
	var bullet = bullet_scene.instantiate()
	bullet.speed = 500
	bullet.position.x = position.x + 70
	bullet.position.y = position.y - 56
	bullet.direction = Vector2(-cos(deg_to_rad(90)), sin(deg_to_rad(90))).normalized()
	bullets.add_child(bullet)
	
	timer.wait_time = 0.2
	
	timer.start()
	await timer.timeout
	
	var bullet2 = bullet_scene.instantiate()
	bullet2.speed = 500
	bullet2.position.x = position.x + 45
	bullet2.position.y = position.y - 51
	bullet2.direction = Vector2(-cos(deg_to_rad(80)), sin(deg_to_rad(80))).normalized()
	bullets.add_child(bullet2)
	
	timer.start()
	await timer.timeout
	var bullet3 = bullet_scene.instantiate()
	bullet3.speed = 500
	bullet3.position.x = position.x + 45
	bullet3.position.y = position.y - 51
	bullet3.direction = Vector2(-cos(deg_to_rad(56)), sin(deg_to_rad(56))).normalized()
	bullets.add_child(bullet3)
