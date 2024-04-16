extends Node2D

var lvl1 = "res://levels/level1/level1.tscn"
var mainMenu = "res://menu/mainMenu.tscn"

func _on_lvl_1_btn_pressed():
	SceneSwitcher.switch_scene(lvl1)
	
func _on_lvl_2_btn_pressed():
	pass

func _on_lvl_3_btn_pressed():
	pass

func _on_back_btn_pressed():
	SceneSwitcher.switch_scene(mainMenu)
