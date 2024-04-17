extends Area2D

@onready var cave_trap: Area2D = $"."
var playerDetected: bool = false

func _process(delta):
	cave_trap.position.y -= 10 * delta

func _on_dedect_body_entered(body):
	if body && body.is_in_group("player"):
		playerDetected = true
