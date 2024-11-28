extends Node2D
@onready var shooter: Node2D = $".."
@onready var enemies_generator: Node2D = $"."

@export var containers: Array[PackedScene]
var t = 0.0
var currentContainer: EnemyContainer = null

func _ready() -> void:
	_new_container()
	if shooter.actual_level == "Level 2":
		enemies_generator.visible = not enemies_generator.visible

func _new_container():
	if not currentContainer == null:
		currentContainer.queue_free()
	var scene: PackedScene = containers.pick_random()
	var container: EnemyContainer = scene.instantiate()
	currentContainer = container
	add_child(container)
	container.end_round.connect(_new_container)
	container.position.y = -200
	t = 0.0

func _physics_process(delta: float) -> void:
	t += delta * 0.05
	currentContainer.position = currentContainer.position.lerp(Vector2(0.0, 0.0), t)
