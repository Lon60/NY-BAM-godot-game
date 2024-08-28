extends CharacterBody2D


var GRAVITY = 1
var SPEED := 250.0
const JUMP_VELOCITY := -250.0
var dead := false
var directionRight := true
var jump_played := false

@onready var player_sprite: Sprite2D = %PlayerSprite
@onready var animation_player = $AnimationPlayer
var deathScreen: String = "res://menu/deathScreen/deathScreen.tscn"
var levelMenu: String = "res://menu/levelMenu/levelMenu.tscn"

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("jump")
		jump_played = true

func _physics_process(delta: float) -> void:
	if Input.get_axis("ui_left", "ui_right"):
		var direction = Input.get_axis("ui_left", "ui_right")
		velocity.x = direction * SPEED
	elif Input.is_action_just_pressed("ui_cancel"):
		SceneSwitcher.switch_scene(levelMenu)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			animation_player.play("idle")
	
	if not is_on_floor():
		velocity.y += gravity * GRAVITY * delta
	else:
		if jump_played:
			jump_played = false
		if velocity.x == 0 and animation_player.animation_finished:
			animation_player.play("idle")
		elif velocity.x != 0:
			animation_player.play("player_run")
	
	if velocity.x < 0:
		directionRight = false
		player_sprite.flip_h = true
	elif velocity.x > 0:
		directionRight = true
		player_sprite.flip_h = false
		
	if velocity.y < 0 and !jump_played:
		animation_player.play("jump")
		jump_played = true
	
	if dead:
		dead = false
		SceneSwitcher.switch_scene(deathScreen)
	
	move_and_slide()
