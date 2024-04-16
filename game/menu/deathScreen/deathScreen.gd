extends Node2D

@onready var back_btn = $MarginContainer/HBoxContainer/VBoxContainer/backBtn as Button
@onready var mainMenu = "res://menu/mainMenu.tscn"

func _on_back_btn_pressed():
		SceneSwitcher.switch_scene(mainMenu)
