extends Node2D

@export var containers: Array[PackedScene]

func _ready() -> void:
	_new_container()

func _new_container():
	for c in get_children():
		c.queue_free()
	var scene: PackedScene = containers.pick_random()
	var container: EnemyContainer = scene.instantiate()
	add_child(container)
	container.end_round.connect(_new_container)
