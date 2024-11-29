extends CanvasLayer

@onready var score_node: Control = $"../ScoreManager"
@onready var end_game: CanvasLayer = $EndGame

func ejecutar():
	end_game.set_values(score_node.score)
	end_game.visible = not end_game.visible
	visible = not visible
	get_tree().paused = visible
