extends Area2D

var levelMenu = "res://menu/levelMenu/levelMenu.tscn"
@export var level:int

func _on_body_entered(body):
	SceneSwitcher.switch_scene(levelMenu)
	GlobalController.lvlPassed(level)
