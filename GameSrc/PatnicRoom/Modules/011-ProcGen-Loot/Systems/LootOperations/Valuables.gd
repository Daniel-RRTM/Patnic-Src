extends Node
class_name _API_011_Loot_Valuables


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "add generates Valuable"      ,
			"parameter" : ["Type","SubType","Rarity Range"]                    ,
			"inputs"      : [
				[["REAGENTS"],["ALL_SUB_TYPES","HERMETIC","SHAMANIC","CHAOTIC"],["X TO Y"]],
				[["PERFORMANCE_ENHANCING_DRUGS"],["ALL_SUB_TYPES","AMPHETAMINES","OPIOTS","BARBITURATES"],["X TO Y"]],
				[["PRE_CRASH_DATA"],["ALL_SUB_TYPES","SCIENCE","CULTURE","META"],["X TO Y"]],
			]}



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	var filter      = API_001_Atlas.LootFilter().getEntry(parameter[0]).getCompValue("C_61_LOOT_TABLE")["DECLARATION"]
	var type        = filter["100_OF_100"]["type"]
	var subType     = filter["100_OF_100"]["subType"]
	var rarityRange = filter["100_OF_100"]["rarity"]
	
	
	if type == "ALL_TYPE" : type = Utils.rng().getRandomFromArray(["PERFORMANCE_ENHANCING_DRUGS","REAGENTS","PRE_CRASH_DATA"])
	
	if subType == "ALL_SUB_TYPE":
		match type:
			"PERFORMANCE_ENHANCING_DRUGS" : subType = Utils.rng().getRandomFromArray(["AMPHETAMINES","OPIOTS","BARBITURATES"])
			"PRE_CRASH_DATA"              : subType = Utils.rng().getRandomFromArray(["SCIENCE","CULTURE","META"])
			"REAGENTS"                    : subType = Utils.rng().getRandomFromArray(["HERMETIC","SHAMANIC","CHAOTIC"])
	
	var rarity = Utils.rng().getRandomNumber(rarityRange[0],rarityRange[1])


	var comp = API_003_Player.currentChar.getComp("C_50_VALUABLES")
	comp.add(type,subType,rarity)
	
	var toString
	match type:
		"PERFORMANCE_ENHANCING_DRUGS" : toString = "performance enhancing "+subType.to_lower()+" of quality "+str(rarity)
		"PRE_CRASH_DATA"              : toString = subType.to_lower()+" pre-crash data of quality "+str(rarity)
		"REAGENTS"                    : toString = subType.to_lower()+" reagents of quality "+str(rarity)
	
	
	
	API_014_NewsLog.gearEntry("Valuable found!   "+toString)

