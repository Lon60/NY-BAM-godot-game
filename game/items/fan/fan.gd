extends Area2D

var player:CharacterBody2D = null

func _process(delta):
	if player:
		player.velocity.y -= 50


func _on_player_dedect_body_entered(body):
	if body && body.is_in_group("player"):
		player = body

func _on_player_dedect_body_exited(body):
	player = null
