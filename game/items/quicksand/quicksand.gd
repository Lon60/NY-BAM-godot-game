extends Area2D

var player:CharacterBody2D = null
var slow_down_factor: float = 0.5

func _process(delta):
	if player:
		player.velocity *= slow_down_factor

func _on_body_entered(body):
	if body && body.is_in_group("player"):
		player = body


func _on_body_exited(body):
	player = null
