extends Area2D

@onready var bullet = $"."
@onready var cpu_particles_2d = $CPUParticles2D
@onready var texture_rect = $TextureRect

var hit = false

func _process(delta):
	if !hit:
		bullet.position.x += 200 * delta


func _on_body_entered(body):
	hit = true
	texture_rect.visible = false
	cpu_particles_2d.emitting = true
	await get_tree().create_timer(0.5).timeout
	queue_free()

