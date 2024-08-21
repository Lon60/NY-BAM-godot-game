shader_type canvas_item;

void vertex() {
	UV.y -= TIME * 0.2;
	UV.x -= TIME * 0.2;
}
