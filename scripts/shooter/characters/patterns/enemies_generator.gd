extends Node2D
@onready var shooter: Node2D = $".."
@onready var enemies_generator: Node2D = $"."

@export var containers: Array[PackedScene]
var t = 0.0
var currentContainer: EnemyContainer = null
var appearing = true

func _ready() -> void:
	_new_container()

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
	var move_vec = Vector2(0.0, 0.0) if appearing else Vector2(0.0, -200.0)
	currentContainer.position = currentContainer.position.lerp(move_vec, t)
	
func disappear():
	t = 0
	appearing = false

func appear():
	t = 0
	appearing = true
