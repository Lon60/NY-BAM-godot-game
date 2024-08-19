extends Node2D

@onready var player: CharacterBody2D = %Player

func _process(delta):
	if player.position.y > 1000:
		player.dead = true

func _on_water_player_dedect_body_entered(body):
	if body && body.is_in_group("player"):
		body.dead = true
