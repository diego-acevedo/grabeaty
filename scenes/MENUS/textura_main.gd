extends TextureRect

var velocidad = Vector2(25, 0)  
var offset = Vector2(0, 0)  

func _process(delta):
	offset += velocidad * delta
	var texture_size = texture.get_size()
	position = Vector2(int(-offset.x) % int(texture_size.x), int(-offset.y) % int(texture_size.y))
