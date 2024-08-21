extends Node2D

var mainMenu: String = "res://menu/mainMenu.tscn"
var lvl1: String = GlobalController.lvl1
var lvl2: String = GlobalController.lvl2
var lvl3: String = GlobalController.lvl3

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		respawn()

func _on_back_btn_pressed() -> void:
	SceneSwitcher.switch_scene(mainMenu)

func _on_retry_btn_pressed() -> void:
	respawn()
	
func respawn() -> void:
	var lastPlayedLvl: int = GlobalController.lastPlayedLvl
	var levelPath: String
	match lastPlayedLvl:
		1:
			levelPath = lvl1
		2:
			levelPath = lvl2
		3:
			levelPath = lvl3
		_: 
			levelPath = mainMenu
	SceneSwitcher.switch_scene(levelPath)
