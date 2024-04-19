extends Node2D

var lvl1: String = GlobalController.lvl1
var lvl2: String = GlobalController.lvl2
var lvl3: String = GlobalController.lvl3
var mainMenu: String = "res://menu/mainMenu.tscn"

@onready var lvl_1_btn: Button = $MarginContainer/HBoxContainer/Level1/lvl1Btn
@onready var lvl_2_btn: Button = $MarginContainer/HBoxContainer/Level2/lvl2Btn
@onready var lvl_3_btn: Button = $MarginContainer/HBoxContainer/Level3/lvl3Btn

@onready var animation_player = $AnimationPlayer

@onready var level_2: Control = $MarginContainer/HBoxContainer/Level2
@onready var level_3: Control = $MarginContainer/HBoxContainer/Level3
const lvl2_png = preload("res://menu/levelMenu/level2.png")
const lvl3_png = preload("res://menu/levelMenu/level3.png")
@onready var lvl2_padlock = $MarginContainer/HBoxContainer/Level2/Level2/HBoxContainer/VBoxContainer/padlock
@onready var lvl3_padlock = $MarginContainer/HBoxContainer/Level3/Level3/HBoxContainer/VBoxContainer/padlock

func _process(delta):
	if GlobalController.canAccessLvl(2):
		lvl_2_btn.disabled = false
		var new_stylebox = StyleBoxTexture.new()
		new_stylebox.texture = lvl2_png
		level_2.add_theme_stylebox_override("panel", new_stylebox)
		lvl2_padlock.hide()
	if GlobalController.canAccessLvl(3):
		var new_stylebox = StyleBoxTexture.new()
		new_stylebox.texture = lvl3_png
		lvl_3_btn.disabled = false
		level_3.add_theme_stylebox_override("panel", new_stylebox)
		lvl3_padlock.hide()
func _on_lvl_1_btn_pressed():
	GlobalController.lastPlayedLvl = 1
	SceneSwitcher.switch_scene(lvl1)
	
func _on_lvl_2_btn_pressed():
	GlobalController.lastPlayedLvl = 2
	SceneSwitcher.switch_scene(lvl2)

func _on_lvl_3_btn_pressed():
	GlobalController.lastPlayedLvl = 3
	SceneSwitcher.switch_scene(lvl3)

func _on_back_btn_pressed():
	SceneSwitcher.switch_scene(mainMenu)


# --- visual effects ---
#Lvl1
func _on_lvl_1_btn_mouse_entered():
	animation_player.play("lvl1_mouseEnter")
func _on_lvl_1_btn_mouse_exited():
	animation_player.play("lvl1_mouseLeft")
#Lvl2
func _on_lvl_2_btn_mouse_entered():
	animation_player.play("lvl2_mouseEnter")
func _on_lvl_2_btn_mouse_exited():
	animation_player.play("lvl2_mouseLeft")
#Lvl3
func _on_lvl_3_btn_mouse_entered():
	animation_player.play("lvl3_mouseEnter")
func _on_lvl_3_btn_mouse_exited():
	animation_player.play("lvl3_mouseLeft")
