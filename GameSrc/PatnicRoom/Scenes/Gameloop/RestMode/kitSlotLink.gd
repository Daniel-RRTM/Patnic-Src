extends Button



func _on_Button_pressed() -> void:
	text = "+1 KITSLOT!"
	API_003_Player.currentChar.getComp("C_39_KITSLOT_PROGRESSION").value = 0
	API_003_Player.currentChar.getComp("C_25_MAX_KITSETS").value += 1
