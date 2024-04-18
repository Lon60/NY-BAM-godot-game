extends Area2D

var player:CharacterBody2D = null
var fanIsOn = false

func _process(delta):
	if player && fanIsOn:
		player.velocity.y -= 20


func _on_player_dedect_body_entered(body):
	if body && body.is_in_group("player"):
		player = body

func _on_player_dedect_body_exited(body):
	player = null

func _on_timer_timeout():
	fanIsOn = !fanIsOn
