extends Node2D

var levelMenu: String = "res://menu/levelMenu/levelMenu.tscn"


func _on_play_btn_pressed():
	SceneSwitcher.switch_scene(levelMenu)



func _on_button_3_pressed():
	get_tree().quit()
