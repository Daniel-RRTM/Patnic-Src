extends Control


func _input(event):
	if event.is_action("Interface_Mouse_Left"):
		get_parent().get_parent().remove_child(get_node(".."))


