extends Control

@onready var multiplier_level_node: Label = $"../Rythm/UI/Meters/Bonus"
@onready var multiplier_bar_node: TextureProgressBar = $"../Rythm/UI/Meters/BonusMeter"
@onready var score_node: Label = $"../Rythm/UI/Meters/Score"
@onready var weapon_node: Sprite2D = $"../Rythm/UI/Meters/BonusIcon"
@onready var fuel_meter_node: Node2D = $"../Rythm/UI/Meters/FuelMeter"
@onready var light: Sprite2D = $"../Rythm/UI/Light"

@onready var game_over_node: CanvasLayer = $"../GameOver"
@onready var win_node: CanvasLayer = $"../YouWin"

@onready var shooter_node: Node2D = $"../Shooter"

var score: int = 0
var max_score: int = 9999999
var multiplier_bar: float = 0.0
var multiplier_level: int = 1
var fuel_meter_angle = 0.0
var missed_notes = 0

var BAR_STEP: float = 1.0 / 5.0
var FUEL_STEP: int = 1

signal game_over

func _ready() -> void:
	update_score_ui()

func _process(delta: float) -> void:
	light.modulate.a = move_toward(light.modulate.a, 0, 0.7 * delta)

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
	missed_notes = 0
	multiplier_bar += BAR_STEP / multiplier_level
	if multiplier_bar >= 1.0:
		shooter_node.upgrade()
		if multiplier_level == 5:
			multiplier_bar = 1
		else:
			multiplier_level += 1
			multiplier_bar = 0.0 
	fuel_meter_angle += 5 * FUEL_STEP
	if fuel_meter_angle > 90:
		fuel_meter_angle = 90
	add_score(10)
	
func note_miss() -> void:
	light.modulate.a = 0.6
	shooter_node.downgrade()
	missed_notes += 1
	if multiplier_level == 1:
		multiplier_bar = 0
	else:
		multiplier_level -= 1
	fuel_meter_angle -= 2**missed_notes * FUEL_STEP
	if fuel_meter_angle < -90:
		fuel_meter_angle = -90
		#game_over.emit()
		gameover()
	add_score(0)
	
func fail() -> void:
	shooter_node.downgrade()
	if multiplier_level == 1:
		multiplier_bar = 0
	else:
		multiplier_level -= 1
	fuel_meter_angle -= 5 * FUEL_STEP
	if fuel_meter_angle < -90:
		fuel_meter_angle = -90
		#game_over.emit()
		gameover()
	add_score(0)

func enemy_killed() -> void:
	add_score(200)
	
func gameover():
	game_over_node.ejecutar()
	
func finish_level():
	if score >= 7000:
		win_node.ejecutar()
	else:
		game_over_node.ejecutar()
	
	
