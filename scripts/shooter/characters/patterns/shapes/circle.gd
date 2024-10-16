extends Pattern

@export var width: int = 50
@export var height: int = 50
var angles = {}

func _ready() -> void:
	super._ready()
	for i in range(enemies.size()):
		var enemy = enemies[i]
		angles[enemy] = 2 * PI / enemiesScenes.size() * i
		enemy.position.x = width * sin(angles[enemy])
		enemy.position.y = height * cos(angles[enemy])
	
func _physics_process(delta: float) -> void:
	for enemy in enemies:
		var radius = sqrt(pow(width * sin(angles[enemy]), 2) + pow(height * cos(angles[enemy]), 2))
		angles[enemy] += speed / radius * delta
		enemy.position.x = width * sin(angles[enemy])
		enemy.position.y = height * cos(angles[enemy])
