extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var cpu_particles_2d = $CPUParticles2D

var on = false
var count = 1

func _on_timer_timeout():
	if on:
		if count == 5:
			cpu_particles_2d.emitting = false
			cpu_particles_2d.hide()
			on = false
			animated_sprite_2d.play("off")
			count = 1
		else:
			count += 1
	else:
		cpu_particles_2d.emitting = true
		cpu_particles_2d.show()
		on = true
		animated_sprite_2d.play("on")

func _on_area_2d_body_entered(body):
	if on && body && body.is_in_group("player"):
		body.dead = true
