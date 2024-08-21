extends CharacterBody2D


var SPEED := 300.0
const JUMP_VELOCITY := -250.0
var dead := false
var directionRight := true

@onready var player_sprite: Sprite2D = %PlayerSprite
@onready var animation_player = $AnimationPlayer
var deathScreen: String = "res://menu/deathScreen/deathScreen.tscn"
var levelMenu: String = "res://menu/levelMenu/levelMenu.tscn"

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		SceneSwitcher.switch_scene(levelMenu)
		
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta	
		if(velocity.y > 0):
			pass # fall
		else:
			pass # jump
	else:
		if(velocity.x == 0) and animation_player.animation_finished:
			animation_player.play("idle")
		else:
			animation_player.play("player_run")
	
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if(velocity.x < 0):
			directionRight = false
			player_sprite.flip_h = true;
		else:
			directionRight = true
			player_sprite.flip_h = false;
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	if dead:
		dead = false
		SceneSwitcher.switch_scene(deathScreen)
