extends Node2D

@onready var play_btn = $MarginContainer/HBoxContainer/HBoxContainer/VBoxContainer/PlayBtn as Button
var levelMenu = "res://menu/levelMenu/levelMenu.tscn"


func _on_play_btn_pressed():
	SceneSwitcher.switch_scene(levelMenu)


