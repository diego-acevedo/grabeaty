extends Node2D

@onready var bonus_meter: TextureProgressBar = $UI/Meters/BonusMeter
@onready var fuel_meter: Sprite2D = $UI/Meters/FuelMeter
@onready var bonus_icon: Sprite2D = $UI/Meters/BonusIcon

func _input(event: InputEvent) -> void:
	
	# Un input para cerrar el juego con tan solo apretar la tecla "ESC".
	
	if event.is_action_pressed("EXIT"):
		get_tree().quit()


func pass_to_main():
	get_parent().correct_to_shoot()
	

#func _physics_process(_delta: float) -> void:
	#if (bonus_meter.value < 100):
		#bonus_meter.value += 1
	#else:
		#bonus_meter.value = 0
		#
	#fuel_meter.rotation = 1.5*sin(Time.get_unix_time_from_system())
