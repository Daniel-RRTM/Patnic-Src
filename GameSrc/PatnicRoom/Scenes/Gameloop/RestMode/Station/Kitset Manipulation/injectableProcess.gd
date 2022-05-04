extends Button

var modificationClass

var kitPartEnum
var modeEnum

func _on_press():
	if kitPartEnum == ENUM.KITS.PARTS.BASE and modeEnum == ENUM.KITS.STATION_MODE.REMOVE: clearSlot()
	else:
		
		API_003_Player.getCurrent_005_Common_Stationetter().setMode(modeEnum)
		# current Kit node
		match modeEnum:
			ENUM.KITS.STATION_MODE.ADD    : get_node("../../../../").showListOfRelevantKitParts(kitPartEnum) 
			ENUM.KITS.STATION_MODE.REMOVE : get_node("../../../../").setNewKiSsetSlotToMod(kitPartEnum)
			ENUM.KITS.STATION_MODE.CHANGE : get_node("../../../../").showListOfRelevantKitParts(kitPartEnum)
			


func clearSlot():
	var cache = API_003_Player.getCurrentStation().kitset.toString
	API_003_Player.removeGearedKitSet(cache)
	get_node("../../../../../Geared Kitsets").fillListWithKitSets()

