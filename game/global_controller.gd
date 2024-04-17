extends Node

var levels: Dictionary = {
	1: false,
	2: false,
	3: false
}
	
func lvlPassed(level):
	levels[level] = true
	
func canAccessLvl(level):
	if levels[level] || levels[level - 1]:
		return true
	else:
		return false
