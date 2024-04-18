extends Node2D



func _on_area_2d_body_entered(body):
	if body && body.is_in_group("player"):
		print(body.velocity.y)
		body.velocity.y -= 175
		print(body.velocity.y)
		print("---")
