extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var fire = $Fire

var on = false
@export var count = 1

func _on_timer_timeout():
	if on:
		if count == 5:
			on = false
			fire.play("end")
			animated_sprite_2d.play("off")
			count = 1
		else:
			count += 1
	else:
		fire.show()
		on = true
		fire.play("start")
		animated_sprite_2d.play("on")

func _on_area_2d_body_entered(body):
	if on && body && body.is_in_group("player"):
		body.dead = true

func _on_fire_animation_finished():
	if !on:
		fire.hide()
	else:
		fire.play("loop")
