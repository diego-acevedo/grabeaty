extends Node2D
class_name Pattern

@export var enemiesScenes: Array[PackedScene]
@export var speed: float = 50
var enemies: Array[Enemy] = []

func _ready() -> void:
	for i in range(enemiesScenes.size()):
		var enemy: Enemy = enemiesScenes[i].instantiate()
		enemy.dead.connect(_remove_dead_unit)
		add_child(enemy)
		enemies.append(enemy)

func _remove_dead_unit(unit):
	enemies.erase(unit)
