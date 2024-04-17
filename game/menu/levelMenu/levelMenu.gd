extends Node2D

var lvl1 = "res://levels/level1/level1.tscn"
var lvl2 = "res://levels/level2/level2.tscn"
var lvl3 = "res://levels/level3/level3.tscn"
var mainMenu = "res://menu/mainMenu.tscn"

func _on_lvl_1_btn_pressed():
	SceneSwitcher.switch_scene(lvl1)
	
func _on_lvl_2_btn_pressed():
	SceneSwitcher.switch_scene(lvl2)

func _on_lvl_3_btn_pressed():
	SceneSwitcher.switch_scene(lvl3)

func _on_back_btn_pressed():
	SceneSwitcher.switch_scene(mainMenu)
