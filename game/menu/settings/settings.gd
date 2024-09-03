extends Node2D


var mainMenu: String = "res://menu/mainMenu.tscn"

func _on_back_btn_pressed():
	SceneSwitcher.switch_scene(mainMenu)

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel"):
			SceneSwitcher.switch_scene(mainMenu)
