extends Node2D

@onready var lvl_1_btn = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/lvl1Btn as Button
@onready var lvl_2_btn = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/lvl2Btn as Button
@onready var lvl_3_btn = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/lvl3Btn as Button

@onready var lvl1 = "res://levels/level1/level1.tscn"
@onready var mainMenu = "res://menu/mainMenu.tscn"

func _on_lvl_1_btn_pressed():
	SceneSwitcher.switch_scene(lvl1)
	
func _on_lvl_2_btn_pressed():
	pass

func _on_lvl_3_btn_pressed():
	pass

func _on_back_btn_pressed():
	SceneSwitcher.switch_scene(mainMenu)
