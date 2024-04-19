extends Node2D

var lvl1: String = GlobalController.lvl1
var lvl2: String = GlobalController.lvl2
var lvl3: String = GlobalController.lvl3
var mainMenu: String = "res://menu/mainMenu.tscn"

@onready var lvl_1_btn = $MarginContainer/HBoxContainer/Level1/lvl1Btn
@onready var lvl_2_btn = $MarginContainer/HBoxContainer/Level2/lvl2Btn
@onready var lvl_3_btn = $MarginContainer/HBoxContainer/Level3/lvl3Btn


func _process(delta):
	if GlobalController.canAccessLvl(2):
		lvl_2_btn.disabled = false
	if GlobalController.canAccessLvl(3):
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
