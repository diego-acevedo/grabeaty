extends Area2D

var speed = -500  # Velocidad que aplicaremos después
var damage = 10 #Daño que hace la bala
		
func _physics_process(delta: float) -> void:
	position += transform.y * speed * delta

func _ready():
	body_entered.connect(_on_bullet_body_entered)

func _on_bullet_body_entered(body):
	if body.has_method("take_damage"):  
		body.take_damage(damage)  
		queue_free()  # Destruye la bala después de colisionar
