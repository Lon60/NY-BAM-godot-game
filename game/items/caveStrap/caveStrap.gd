extends RigidBody2D

@onready var cave_trap: RigidBody2D = $"."
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var png = $png


var playerDetected: bool = false

func _process(delta):
	if playerDetected:
		cave_trap.freeze = false

func _on_dedect_body_entered(body):
	if body && body.is_in_group("player"):
		playerDetected = true
		
func _on_cave_trap__body_entered(body):
	if !(body == cave_trap):
		call_deferred("despawn")
		if body && body.is_in_group("player"):
			body.dead = true

func despawn():
	cpu_particles_2d.emitting = true
	await get_tree().create_timer(0.2).timeout
	png.visible = false
	await get_tree().create_timer(0.55).timeout
	queue_free()
