extends Node2D

@onready var player: CharacterBody2D = $player

func _process(delta):
	if player.position.y > 1000:
		player.dead = true
