extends Node2D


func _on_reset_pressed() -> void:
	var dir = Directory.new()
	var cache = get_node("List/ScrollContainer/VBoxContainer")
	
	for element in cache.allKnownElements: 
		dir.remove(element.filepath)
		element.queue_free()
