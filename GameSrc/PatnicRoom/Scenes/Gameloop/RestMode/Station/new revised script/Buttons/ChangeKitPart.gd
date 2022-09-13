extends Button


onready var currentKitSetDetails = get_node("../../../parent")
onready var station = get_node("../../../..")

func _on_press(kitPartEnum,modeEnum) -> void:
	API_003_Player.stationSetter.setMode(modeEnum)
	var kitsetToBuild = currentKitSetDetails.kitSetEnt
	
	



