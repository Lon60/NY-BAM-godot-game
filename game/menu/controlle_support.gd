extends Button

var isInControllerMode: bool = true

func _ready() -> void:
	grab_focus()

func _unhandled_input(event):
	if event is InputEventMouseButton && isInControllerMode:
		isInControllerMode = false
		release_focus()
	elif Input.is_action_just_pressed("enter_controller_mode_menu") && !isInControllerMode:
		grab_focus()
		isInControllerMode = true
