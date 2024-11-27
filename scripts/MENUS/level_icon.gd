class_name LevelIcon
extends Area2D

@onready var level_icon: Sprite2D = $LevelIcon
@onready var marker: Sprite2D = $Marker
@onready var level_name: Label = $LevelName
@onready var lock: Sprite2D = $Lock

@export var sprite_coord: Vector2i
@export var handle: String
@export var active: bool

var level_info = null

func _ready() -> void:
	level_info = StaticData.read(StaticData.levels)[handle]
	level_icon.frame_coords = sprite_coord
	level_name.text = level_info.name
	if not active:
		level_icon.modulate.a = 0.5
		lock.visible = true

func focus():
	if active:
		SoundManager.play(SoundManager.CURSOR)
	marker.visible = active

func unfocus():
	marker.visible = false

func select():
	if active:
		SoundManager.play(SoundManager.ACCEPT)
		print(StaticData.read(StaticData.levels)[handle])
