extends Node2D


var mainMenu: String = "res://menu/mainMenu.tscn"
@onready var fps_edit: TextEdit = $MarginContainer/VBoxContainer/HBoxContainer/fpsEdit

func _on_back_btn_pressed():
	SceneSwitcher.switch_scene(mainMenu)



func _on_fps_edit_text_changed():
	var filtered_text = ""
	for char in fps_edit.text:
		if char in "0123456789":
			filtered_text += char
	filtered_text = filtered_text.substr(0, 4)
	if filtered_text != fps_edit.text:
		fps_edit.text = filtered_text
		fps_edit.call_deferred("set_text", filtered_text)
		fps_edit.call_deferred("set_caret_position", len(filtered_text))
