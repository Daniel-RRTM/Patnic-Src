extends Node
class_name _005_Common_StationSetter


var currentStation


func setKitset(kitset:KitSetEntity):
	updateCurrentStation()
	setOnDefault()
	currentStation.kitset = kitset


func setKitPartToMod(kitPart:KitPartEntity):
	updateCurrentStation()
	currentStation.kitpartToMod = kitPart
	currentStation.maxLength    = kitPart.modTime()


func setMode(modeEnum:int):
	updateCurrentStation()
	currentStation.mode = modeEnum

func confirmTask():
	updateCurrentStation()
	currentStation.isCounting = true






func setOnDefault():
	# NULLPOINTER
	currentStation.kitset       = null 
	currentStation.kitpartToMod = null
	
	# INVALID
	currentStation.mode      = -1  
	currentStation.maxLength = -1
	
	# VALID
	currentStation.currentLength = 0
	currentStation.isReady       = false 
	currentStation.isCounting    = false



func updateCurrentStation(): currentStation = API_003_Player.stations.currentStation











