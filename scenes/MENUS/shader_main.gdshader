shader_type canvas_item;

uniform vec2 velocidad = vec2(0.1, 0.0); // Velocidad del movimiento
uniform float tiempo : time; // Tiempo global

void fragment() {
    vec2 desplazamiento = UV + velocidad * tiempo;
    COLOR = texture(TEXTURE, desplazamiento);
}
