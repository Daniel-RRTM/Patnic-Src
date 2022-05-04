extends Panel

# REFACTOR delete


var isOn = false
func _input(event: InputEvent) -> void:
	if event.is_pressed() and Util.Nodes.isMouseOnNode(self) and event.is_action("Interface_Mouse_Left"):
		
		if isOn:
			get_node("../AnimationPlayer").play("turn off")
			isOn = false
		else:
			get_node("../AnimationPlayer").play("turn on")
			isOn = true
					
