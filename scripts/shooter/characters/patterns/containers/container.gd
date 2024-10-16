extends Node2D
class_name EnemyContainer

var patterns = []

signal end_round

func _ready() -> void:
	for child in get_children():
		if child is Pattern:
			child.empty_pattern.connect(_remove_pattern)
			patterns.append(child)
	
func _remove_pattern(pattern):
	patterns.erase(pattern)
	if patterns.is_empty():
		end_round.emit()
