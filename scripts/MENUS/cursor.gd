extends Node2D

var speed = 500
var velocity = Vector2(0, 0)
var acceleration = 5000

var element: LevelIcon = null

@onready var focus: Area2D = $Focus

func _ready() -> void:
	focus.area_entered.connect(_on_area_entered)
	focus.area_exited.connect(_on_area_exited)

func _physics_process(delta: float) -> void:
	var move_input = Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, speed * move_input, acceleration * delta)
	move_input = Input.get_axis("move_up", "move_down")
	velocity.y = move_toward(velocity.y, speed * move_input, acceleration * delta)
	
	position += velocity * delta
	position.x = min(640, max(0, position.x))
	position.y = min(360, max(0, position.y))
	
	if Input.is_action_just_pressed("select"):
		_select()
	
func _on_area_entered(node: Node):
	if node is LevelIcon:
		element = node
		node.focus()

func _on_area_exited(node: Node):
	if node is LevelIcon:
		element = null
		node.unfocus()
		
func _select():
	if element != null:
		element.select()
