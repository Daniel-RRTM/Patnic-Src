extends Button



func _on_Button_pressed() -> void:
	Davinci.FSM_Hub.changeSzeneByInputEnum(5,0)
	API_003_Player.stations
