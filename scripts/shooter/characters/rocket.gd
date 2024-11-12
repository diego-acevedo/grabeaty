extends Area2D
@onready var animation_player: AnimationPlayer = $AllFireBulletPixel16x1602/AnimationPlayer

var speed = -500  # Velocidad que aplicaremos después
var damage = 20 #Daño que hace el cohete
var angler = 90 
var direction = Vector2(-cos(deg_to_rad(angler)), sin(deg_to_rad(angler))).normalized()#Direccion de la bala
var explosion_damage = 10
var max_explosion_radius = 200
var explosion_duration = 1.0

var exploded = false

var explosion_scene = preload("res://scenes/shooter/characters/bullets/explosion.tscn")

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	if position.y < -200:
		queue_free()

func _ready():
	body_entered.connect(_on_rocket_body_entered)
	direction = Vector2(-cos(deg_to_rad(angler)), sin(deg_to_rad(angler))).normalized()
	animation_player.speed_scale = 0.2
	animation_player.play("start")
	
func explode():
	exploded = true
	var explosion = explosion_scene.instantiate()
	explosion.global_position = position
	get_parent().call_deferred("add_child", explosion)

func _on_rocket_body_entered(body):
	if exploded == false and body.has_method("take_damage"):  
		body.take_damage(damage)  
		explode()
		queue_free()
		
