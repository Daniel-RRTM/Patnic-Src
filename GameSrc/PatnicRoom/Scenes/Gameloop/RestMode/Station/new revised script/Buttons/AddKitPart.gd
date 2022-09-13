extends Button


onready var currentKitSetDetails = get_node("../../../parent")
onready var station = get_node("../../../..")

func _on_press(kitPartEnum,modeEnum) -> void:
	API_003_Player.stationSetter.setMode(modeEnum)
	
	var toInsert = []
	if is_instance_valid(currentKitSetDetails.kitSetEnt):
		API_003_Player.stationSetter.setKitset(currentKitSetDetails.kitSetEnt)
		for kitpart in API_003_Player.currentChar.kitventory().kitparts().getAll():
			if currentKitSetDetails.kitSetEnt.base.family() == kitpart.family() and kitpart.partType()==kitPartEnum:
				toInsert.append(kitpart)
	
	else:
		for kitpart in API_003_Player.currentChar.kitventory().kitparts().getAll():
			if ENUM.SOKRATILES.M_TYPE.keys()[Davinci.externalCachedInput] == kitpart.mType():
				if kitpart.partType() == kitPartEnum:
					toInsert.append(kitpart)
		
	station.get_node("BuildSelection/ScrollContainer").loadItems(toInsert)
	station.get_node("BuildSelection").visible = true
	get_node("../../Base/Remove").visible =false


