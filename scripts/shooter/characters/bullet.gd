extends Area2D
@onready var animation_player: AnimationPlayer = $AllFireBulletPixel16x1602/AnimationPlayer

var speed = -500  # Velocidad que aplicaremos después
var damage = 10 #Daño que hace la bala
		
func _physics_process(delta: float) -> void:
	position += transform.y * speed * delta

func _ready():
	body_entered.connect(_on_bullet_body_entered)
	animation_player.speed_scale = 0.5
	animation_player.play("start_bullet")

func _on_bullet_body_entered(body):
	if body.has_method("take_damage"):  
		body.take_damage(damage)  
		queue_free()  # Destruye la bala después de colisionar
		
