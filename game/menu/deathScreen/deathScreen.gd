extends Node2D

@onready var back_btn = $MarginContainer/HBoxContainer/VBoxContainer/backBtn as Button
@onready var mainMenu = preload("res://menu/mainMenu.tscn")

func _ready():
	back_btn.pressed.connect(self._back_btn_pressed)
	
func _back_btn_pressed():
	get_tree().change_scene_to_packed(mainMenu)
