extends Node2D

@onready var player: CharacterBody2D = $player
@onready var cave_spawn_point = $"Cave SpawnPoint"

func _process(delta):
	if player.position.y > 1000:
		player.dead = true


func _on_cave_entry_body_entered(body):
	if body && body.is_in_group("player"):
		body.position = cave_spawn_point.position

