extends Node2D

@onready var play_btn = $MarginContainer/HBoxContainer/HBoxContainer/VBoxContainer/PlayBtn as Button
@onready var lvl1 = preload("res://levels/level1/level1.tscn")


func _ready():
	play_btn.pressed.connect(self._play_btn_pressed)
	
func _play_btn_pressed():
	get_tree().change_scene_to_packed(lvl1)
