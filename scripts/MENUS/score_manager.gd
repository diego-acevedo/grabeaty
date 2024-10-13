extends Control

@onready var multiplier_level_node: Label = $"../Rythm/UI/Meters/Bonus"
@onready var multiplier_bar_node: TextureProgressBar = $"../Rythm/UI/Meters/BonusMeter"
@onready var score_node: Label = $"../Rythm/UI/Meters/Score"
@onready var weapon_node: Sprite2D = $"../Rythm/UI/Meters/BonusIcon"
@onready var fuel_meter_node: Node2D = $"../Rythm/UI/Meters/FuelMeter"

@onready var enemy_node: Node2D = $"../Shooter"

var score: int = 0
var max_score: int = 9999999
var multiplier_bar: float = 0.0
var multiplier_level: int = 1
var fuel_meter_angle = 0

func _ready() -> void:
	update_score_ui()

func update_score_ui() -> void:
	score_node.text = str(score)
	multiplier_level_node.text = "x" + str(multiplier_level)
	multiplier_bar_node.value = multiplier_bar * 100
	weapon_node.frame = multiplier_level - 1
	fuel_meter_node.set_rotation_degrees(fuel_meter_angle)

func add_score(base_points: int) -> void:
	var total_points = base_points * multiplier_level
	score += total_points
	if score > max_score:
		score = max_score
	update_score_ui()
	
func note_hit() -> void:
	multiplier_bar += 0.04
	if multiplier_bar >= 1.0:
		if multiplier_level == 5:
			multiplier_bar = 1
		else:
			multiplier_level += 1
			multiplier_bar = 0.0 
	fuel_meter_angle += 1
	if fuel_meter_angle > 90:
		fuel_meter_angle = 90
	add_score(10)
	
func note_miss() -> void:
	multiplier_bar -= 0.2
	if multiplier_bar <= 0:
		if multiplier_level == 1:
			multiplier_bar = 0
			multiplier_level = 1
		else:
			multiplier_bar = 1
			multiplier_level -= 1
	fuel_meter_angle -= 15
	if fuel_meter_angle < -90:
		fuel_meter_angle = -90
	add_score(0)

func enemy_killed() -> void:
	add_score(200)
