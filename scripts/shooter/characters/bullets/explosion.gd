extends Area2D

@export var explosion_damage: int = 100
@export var max_radius: float = 200.0
@export var duration: float = 1.0

# Referencias a los nodos
@onready var collision_shape = $CollisionShape2D
@onready var animation_player = $AnimationPlayer

func _ready():
	# Conectar la señal para cuando la animación termine
	animation_player.connect("animation_finished", _on_animation_finished)
	body_entered.connect(_on_explosion_body_entered)
	# Iniciar la animación
	animation_player.play("expansion")

# Lógica para dañar a los enemigos al entrar en contacto con la onda
func _on_explosion_body_entered(body):
	if body.has_method("take_damage"):  
		body.take_damage(explosion_damage)  
		

# Cuando la animación termine, destruir el nodo
func _on_animation_finished(anim_name: String):
	if anim_name == "expansion":
		queue_free()
