extends Panel




func _input(event: InputEvent) -> void:
	if Util.Nodes.isMouseOnNode(self):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
