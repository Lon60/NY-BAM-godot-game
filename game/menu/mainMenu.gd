extends Node2D

var levelMenu = "res://menu/levelMenu/levelMenu.tscn"


func _on_play_btn_pressed():
	SceneSwitcher.switch_scene(levelMenu)

