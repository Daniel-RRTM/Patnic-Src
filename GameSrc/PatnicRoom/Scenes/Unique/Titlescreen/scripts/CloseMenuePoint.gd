extends Node2D


func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_pressed() and event.is_action("Interface_Generall_Escape"):
		var cache = get_node(".")
		get_parent().remove_child(get_node("."))
		cache.queue_free()
