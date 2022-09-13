extends Node
class_name _005_Common_Station


# ----- INITIALICE ----------------------------------------------------------- ##


var meat           : Station
var matrix         : Station
var magic          : Station

var currentStation : Station

class Station:  
	var kitset: KitSetEntity  ; var kitpartToMod   ; var mode: int
	var currentLength: int    ; var maxLength: int ; var isReady: bool ; var isCounting: bool


func _init() :
	meat   = Station.new()
	matrix = Station.new()
	magic  = Station.new()



# ----- MAIN ----------------------------------------------------------------- ##

func updateOnEnteringPanicroom():
	for station in [meat,matrix,magic]:
		if is_instance_valid(station.kitset) and is_instance_valid(station.kitpartToMod):
			currentStation = station
			
			if station.isCounting: station.currentLength += 1
			if station.currentLength == station.maxLength: run()




func run():
	match currentStation.mode:
		ENUM.KITS.STATION_MODE.ADD    : add()
		ENUM.KITS.STATION_MODE.CHANGE : exchange()
		ENUM.KITS.STATION_MODE.REMOVE : remove()
	

	
	



# ----- SETTER --------------------------------------------------------------- ##


func remove(): 
	for part in [currentStation.kitset.base,currentStation.kitset.mod,currentStation.kitset.appendix]: 
		if is_instance_valid(part):
			API_003_Player.currentChar.kitventory().kitparts().append(part)
	
	API_003_Player.currentChar.kitventory().kitparts().append(currentStation.kitpartToMod)
	
	match currentStation.kitpartToMod.partType():
		ENUM.KITS.PARTS.MOD      : currentStation.kitset.mod      = null
		ENUM.KITS.PARTS.APPENDIX : currentStation.kitset.appendix = null
		ENUM.KITS.PARTS.BASE : 
			currentStation.kitset.appendix = null
			currentStation.kitset.base = null
			currentStation.kitset.mod = null



func add(): 
	match currentStation.kitpartToMod.partType():
		ENUM.KITS.PARTS.MOD      : currentStation.kitset.mod      = currentStation.kitpartToMod 
		ENUM.KITS.PARTS.APPENDIX : currentStation.kitset.appendix = currentStation.kitpartToMod
	
	var kitset   = currentStation.kitset
	var kitParts = [ kitset.base, kitset.mod, kitset.appendix ]
	kitset       = API_004_KitSet.getMergedKitsets(kitParts)
	
	var charKitsets = API_003_Player.currentChar.kitventory().kitsets().cacheKitset
	var index = API_003_Player.currentChar.kitventory().kitsets().remove(currentStation.kitset.toString)
	API_003_Player.currentChar.kitventory().kitsets().append(kitset)


func exchange():
	API_003_Player.currentChar.kitventory().kitsets().remove(currentStation.kitset)
	var kitset = []
	
	if currentStation.kitpartToMod.partType() == ENUM.KITS.PARTS.MOD: 
		API_003_Player.currentChar.kitventory().kitparts().append(currentStation.kitset.mod)
		kitset = [currentStation.kitset.base,currentStation.kitpartToMod,currentStation.kitset.appendix]
	
	if currentStation.kitpartToMod.partType() == ENUM.KITS.PARTS.APPENDIX: 
		API_003_Player.currentChar.kitventory().kitparts().append(currentStation.kitset.appendix)
		kitset = [currentStation.kitset.base,currentStation.kitset.mod,currentStation.kitpartToMod]
	
	API_003_Player.currentChar.kitventory().kitsets().append(API_004_KitSet.getMergedKitsets(kitset))
	


func changeStation(enumOfMtype):
	match enumOfMtype:
		ENUM.SOKRATILES.M_TYPE.MEAT: currentStation = meat
		ENUM.SOKRATILES.M_TYPE.MAGIC: currentStation = magic
		ENUM.SOKRATILES.M_TYPE.MATRIX: currentStation = matrix
# ----- GETTER --------------------------------------------------------------- ##


func getCurrentStation(): return currentStation



func getStationByEnum(enumOfStation):
	match enumOfStation:
		ENUM.SOKRATILES.M_TYPE.MEAT   : return meat
		ENUM.SOKRATILES.M_TYPE.MATRIX : return matrix
		ENUM.SOKRATILES.M_TYPE.MAGIC  : return magic



		
