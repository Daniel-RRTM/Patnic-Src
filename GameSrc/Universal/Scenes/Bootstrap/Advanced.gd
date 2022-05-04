extends Button




func _on_pressed() -> void:
	API_009_Sound.playSelectOption()
	visible = false
	get_node("../optionsPanel").visible = true
	get_node("../EventInfo").visible = false
