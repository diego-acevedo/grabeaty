class_name LevelIcon
extends Area2D

@onready var level_icon: Sprite2D = $LevelIcon
@onready var marker: Sprite2D = $Marker
@export var sprite_coord: Vector2i
@export var handle: String

func _ready() -> void:
	level_icon.frame_coords = sprite_coord

func focus():
	marker.visible = true

func unfocus():
	marker.visible = false

func select():
	print("Hola")
