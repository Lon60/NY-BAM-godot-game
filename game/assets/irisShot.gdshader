shader_type canvas_item;

uniform float radius: hint_range(0.0, 1.0) = 0.5;

void fragment() {
    // Zentrum des Bildschirms festlegen
    vec2 center = vec2(0.5, 0.5);

    // Berechne UV-Koordinaten relativ zum Bildschirm
    vec2 uv = SCREEN_UV;

    // Berechne die Distanz vom aktuellen Punkt zum Zentrum
    float dist = distance(uv, center);

    // Entscheide, welche Farbe basierend auf der Distanz gezeichnet werden soll
    if (dist < radius) {
        COLOR = vec4(0.0, 0.0, 0.0, 0.0);  // Innerhalb des Kreises: Transparent
    } else {
        COLOR = vec4(0.0, 0.0, 0.0, 1.0);  // Außerhalb des Kreises: Schwarz
    }
}
