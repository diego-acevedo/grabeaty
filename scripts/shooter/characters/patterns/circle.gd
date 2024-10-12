extends Pattern

@export var width: int = 50
@export var height: int = 50
var angles: Array[float] = []

func _ready() -> void:
	super._ready()
	for i in range(enemies.size()):
		var enemy = enemies[i]
		angles.append(2 * PI / enemiesScenes.size() * i)
		enemy.position.x = width * sin(angles[i])
		enemy.position.y = height * cos(angles[i])
	
func _physics_process(delta: float) -> void:
	for i in range(enemies.size()):
		var enemy = enemies[i]
		var radius = sqrt(pow(width * sin(angles[i]), 2) + pow(height * cos(angles[i]), 2))
		angles[i] += speed / radius * delta
		enemy.position.x = width * sin(angles[i])
		enemy.position.y = height * cos(angles[i])
