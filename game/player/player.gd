extends CharacterBody2D


var SPEED := 300.0
const JUMP_VELOCITY := -400.0
var dead := false
var animPlaySpecial := false
var directionRight := true

@onready var player_sprite: Sprite2D = %PlayerSprite
@onready var animation_player = $AnimationPlayer
var deathScreen: String = "res://menu/deathScreen/deathScreen.tscn"
var levelMenu: String = "res://menu/levelMenu/levelMenu.tscn"
@onready var gun_bullet_spawn = $gun/gunBulletSpawn
@onready var gun = $gun
const bullet = preload("res://items/bullet/bullet.tscn")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		SceneSwitcher.switch_scene(levelMenu)
	if Input.is_action_just_pressed("shoot"):
		var current_bullet = bullet.instantiate()
		current_bullet.directionRight = directionRight
		current_bullet.global_position = gun_bullet_spawn.global_position
		get_parent().add_child(current_bullet)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta	
		if(velocity.y > 0):
			pass # fall
		else:
			pass # jump
	else:
		if(velocity.x == 0 && !animPlaySpecial) and animation_player.animation_finished:
			animation_player.play("idle")
		elif !animPlaySpecial:
			animation_player.play("player_run")
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if(velocity.x < 0):
			if directionRight:
				gun.position.x = -30
				gun_bullet_spawn.position.x = gun_bullet_spawn.position.x * -1 
			directionRight = false
			gun.flip_h = false
			player_sprite.flip_h = true;
		else:
			if !directionRight:
				gun.position.x = 10
				gun_bullet_spawn.position.x = gun_bullet_spawn.position.x * -1
			directionRight = true
			gun.flip_h = true
			player_sprite.flip_h = false;
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	if dead:
		dead = false
		animPlaySpecial = true
		await get_tree().create_timer(0.6).timeout
		animPlaySpecial = false
		SceneSwitcher.switch_scene(deathScreen)

func playIrisIn():
	animation_player.play("IrisIn")
func playIrisOut():
	animation_player.play_backwards("IrisIn")
