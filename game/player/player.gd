extends CharacterBody2D


var SPEED: float = 300.0
const JUMP_VELOCITY: float = -400.0
var dead: bool = false
var animPlaySpecial = false
var directionRight = true

@onready var animSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
var deathScreen: String = "res://menu/deathScreen/deathScreen.tscn"
var levelMenu: String = "res://menu/levelMenu/levelMenu.tscn"
@onready var gun_bullet_spawn = $gun/gunBulletSpawn

const bullet = preload("res://items/bullet/bullet.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		SceneSwitcher.switch_scene(levelMenu)
	if Input.is_action_just_pressed("shoot"):
		var current_bullet = bullet.instantiate()
		current_bullet.directionRight = directionRight
		gun_bullet_spawn.add_child(current_bullet)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta	
		if(velocity.y > 0):
				animSprite.play("fall")
		else:
				animSprite.play("jump")
	else:
		if(velocity.x == 0 && !animPlaySpecial):
				animSprite.play("idle")
		elif !animPlaySpecial:
				animSprite.play("run")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if(velocity.x < 0):
			directionRight = false
			animSprite.flip_h = true;
		else:
			directionRight = true
			animSprite.flip_h = false;

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()
	
	if dead:
		dead = false
		animPlaySpecial = true
		animSprite.play("hit")
		await get_tree().create_timer(0.6).timeout
		animPlaySpecial = false
		SceneSwitcher.switch_scene(deathScreen)
	

func playIrisIn():
	animation_player.play("IrisIn")
func playIrisOut():
	animation_player.play("IrisOut")
