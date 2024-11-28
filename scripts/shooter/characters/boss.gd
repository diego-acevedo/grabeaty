extends Node2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
var health = 100

var boss_attacks = {
	34.16: "rightArm",
	37.91: "leftArm",
	41.74: "Main",
}

var processed_attacks = []

func _ready() -> void:
	anim_player.play("Entrance")
	anim_player.animation_finished.connect(_on_entrance_finished)

func _process(delta: float) -> void:
	pass

func take_damage(amount):
	health = health - amount #daño que le quita
	if health <= 0:
		die()
	else:
		play("damage")
		
func play(animation:String ):
	anim_player.play(animation)
	anim_player.animation_finished.connect(_on_attack_finished)
	
func attack(attack_type):
	if attack_type == "rightArm":
		play("Attack_Right")
	elif attack_type == "leftArm":
		play("Attack_Left")
	elif attack_type == "Main":
		play("Attack_Main")
		
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
