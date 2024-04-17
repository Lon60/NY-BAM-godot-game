extends Node2D

var lvl1: String = GlobalController.lvl1
var lvl2: String = GlobalController.lvl2
var lvl3: String = GlobalController.lvl3
var mainMenu: String = "res://menu/mainMenu.tscn"

@onready var lvl_1_btn: Button = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/lvl1Btn
@onready var lvl_2_btn: Button = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/lvl2Btn
@onready var lvl_3_btn: Button = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/lvl3Btn

const lvl2_icon: CompressedTexture2D = preload("res://assets/pixel-adventure/Menu/Levels/02.png")
const lvl3_icon: CompressedTexture2D = preload("res://assets/pixel-adventure/Menu/Levels/03.png")

func _process(delta):
	if GlobalController.canAccessLvl(2):
		lvl_2_btn.icon = lvl2_icon
		lvl_2_btn.disabled = false
	if GlobalController.canAccessLvl(3):
		lvl_3_btn.icon = lvl3_icon
		lvl_3_btn.disabled = false
		
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
