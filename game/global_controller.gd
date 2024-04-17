extends Node

var levels = {}


func _process(delta):
	pass
	
func lvlPassed(level):
	levels[level] = true
	
func canAccess(level):
	if levels[level] || levels[level - 1]:
		return true
	else:
		return false
