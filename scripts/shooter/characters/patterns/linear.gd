extends Pattern

@export var width: int = 100
@export var height: int = 200
var angles = {}

func _ready() -> void:
	super._ready()
	for i in range(enemies.size()):
		var enemy = enemies[i]
		angles[enemy] = PI / enemiesScenes.size() * i
		enemy.position.x = width * sin(angles[enemy])
		enemy.position.y = height * i / enemies.size() - (height / 2)

func _physics_process(delta: float) -> void:
	for enemy in enemies:
		angles[enemy] += speed / width * delta
		enemy.position.x = width * sin(angles[enemy])
