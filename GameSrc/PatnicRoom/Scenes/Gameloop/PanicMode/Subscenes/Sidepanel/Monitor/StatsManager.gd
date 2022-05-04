extends Control

func _ready() -> void:
	HP()




func HP():
	var healthbar = get_node("HP/ProgressBar")
	healthbar.max_value = API_003_Player.currentChar._005_Character_Stats().indirects().hitpoints()
	healthbar.value     = API_003_Player.currentChar._005_Character_Stats().indirects().hitpoints()
	get_node("HP/barToString").bbcode_text = "[center]"+str(healthbar.value)+" / "+str(healthbar.max_value)
