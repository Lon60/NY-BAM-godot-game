extends Node2D

@onready var lvl_1_btn = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/lvl1Btn as Button
@onready var lvl_2_btn = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/lvl2Btn as Button
@onready var lvl_3_btn = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/lvl3Btn as Button

@onready var lvl1 = preload("res://levels/level1/level1.tscn")

func _ready():
	lvl_1_btn.pressed.connect(self._lvl_1_btn_pressed)
	lvl_2_btn.pressed.connect(self._lvl_2_btn_pressed)
	lvl_3_btn.pressed.connect(self._lvl_3_btn_pressed)

func _lvl_1_btn_pressed():
	get_tree().change_scene_to_packed(lvl1)
	
func _lvl_2_btn_pressed():
	pass
	
func _lvl_3_btn_pressed():
	pass
