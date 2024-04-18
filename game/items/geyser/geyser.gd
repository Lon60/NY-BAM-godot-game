extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var cpu_particles_2d = $CPUParticles2D

var on = false
var count = 1

func _on_timer_timeout():
	if on:
		cpu_particles_2d.emitting = false
		animated_sprite_2d.play("off")
		count += 1
		if count == 5:
			on = false
		else:
			on = true
	else:
		cpu_particles_2d.emitting = true
		animated_sprite_2d.play("on")
		on = true

func _on_area_2d_body_entered(body):
	if on && body && body.is_in_group("player"):
		body.dead = true
