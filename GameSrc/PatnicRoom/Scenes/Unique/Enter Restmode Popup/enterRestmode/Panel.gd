extends Node2D




	




func _on_peace() -> void:
	Gameloop.startRestMode()


func _on_panic() -> void:
	queue_free()
