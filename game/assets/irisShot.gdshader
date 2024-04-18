shader_type canvas_item;

uniform float radius : hint_range(0.0, 1.20) = 0.5;

void fragment() {
    vec2 center = vec2(0.5, 0.5);
    vec2 uv = SCREEN_UV;

    float aspect_ratio = float(SCREEN_PIXEL_SIZE.y) / float(SCREEN_PIXEL_SIZE.x);
    vec2 scaled_uv = uv;

    if (aspect_ratio > 1.0) {
        scaled_uv.x = uv.x * aspect_ratio + (1.0 - aspect_ratio) * 0.5;
    } else {
        float inverse_aspect = 1.0 / aspect_ratio;
        scaled_uv.y = uv.y * inverse_aspect + (1.0 - inverse_aspect) * 0.5;
    }

    float dist = distance(scaled_uv, center);

    if (dist < radius) {
        COLOR = vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        COLOR = vec4(0.0, 0.0, 0.0, 1.0);
    }
}
