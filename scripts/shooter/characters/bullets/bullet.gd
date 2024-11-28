extends Area2D
@onready var animation_player: AnimationPlayer = $AllFireBulletPixel16x1602/AnimationPlayer


var speed = -500  # Velocidad que aplicaremos después
var damage = 10 #Daño que hace la bala
var angler = 90 
var direction = Vector2(-cos(deg_to_rad(angler)), sin(deg_to_rad(angler))).normalized()#Direccion de la bala
		
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	if position.y < -200:
		queue_free()

func _ready():
	body_entered.connect(_on_bullet_body_entered)
	animation_player.speed_scale = 0.2
	animation_player.play("start_bullet")

func _on_bullet_body_entered(body):
	if body.has_method("take_damage"):  
		body.take_damage(damage)  
		queue_free()  # Destruye la bala después de colisionar
		
