extends Node2D

@onready var play_btn = $MarginContainer/HBoxContainer/HBoxContainer/VBoxContainer/PlayBtn as Button
@onready var levelMenu = load("res://menu/levelMenu/levelMenu.tscn").instantiate()


func _on_play_btn_pressed():
	get_tree().get_root().add_child(levelMenu)
