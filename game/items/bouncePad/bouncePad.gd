extends Node2D

@export var yBounce = -175


func _on_area_2d_body_entered(body):
	if body && body.is_in_group("player"):
		body.velocity.y += yBounce
