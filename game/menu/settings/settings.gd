extends Node2D


var mainMenu: String = "res://menu/mainMenu.tscn"

func _on_back_btn_pressed():
	SceneSwitcher.switch_scene(mainMenu)
