extends Node

var lvl1: String = "res://levels/level1/level1.tscn"
var lvl2: String = "res://levels/level2/level2.tscn"
var lvl3: String = "res://levels/level3/level3.tscn"

var levels: Dictionary = {
	1: false,
	2: false,
	3: false
}

var lastPlayedLvl: int = 1
	
func lvlPassed(level):
	levels[level] = true
	
func canAccessLvl(level):
	if levels[level] || levels[level - 1]:
		return true
	else:
		return false
		

func _input(event):
	if event.is_action_pressed("unlock_levels"):
		unlock_all_levels()

func unlock_all_levels():
	for level in levels.keys():
		levels[level] = true
