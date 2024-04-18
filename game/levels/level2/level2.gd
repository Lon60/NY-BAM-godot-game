extends Node2D

@onready var player: CharacterBody2D = $player
@onready var cave_spawn_point = $"Cave SpawnPoint"
@onready var cave_exit_spawn_point = $"CaveExit SpawnPoint"

func _process(delta):
	if player.position.y > 1000:
		player.dead = true


func _on_cave_entry_body_entered(body):
	if body && body.is_in_group("player"):
		body.playIrisIn()
		await get_tree().create_timer(1).timeout
		body.position = cave_spawn_point.position
		await get_tree().create_timer(0.5).timeout
		body.playIrisOut()



func _on_cave_exit_body_entered(body):
	if body && body.is_in_group("player"):
		body.playIrisIn()
		await get_tree().create_timer(1).timeout
		body.position = cave_exit_spawn_point.position
		await get_tree().create_timer(0.5).timeout
		body.playIrisOut()
