extends Pattern

@export var width: int = 100
@export var height: int = 200
@export var angles: Array[float]

func _ready() -> void:
	super._ready()
	for i in range(enemies.size()):
		var enemy = enemies[i]
		angles.append(PI / enemiesScenes.size() * i)
		enemy.position.x = width * i / enemies.size() - (width / 2)
		enemy.position.y = height * i / enemies.size() - (height / 2)

func _physics_process(delta: float) -> void:
	for i in range(enemies.size()):
		var enemy = enemies[i]
		angles[i] += speed / width * delta
		enemy.position.x = width * sin(angles[i])
