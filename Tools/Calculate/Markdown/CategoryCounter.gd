extends Node
class_name Statistics_JSON_Generall

static func countCategoryEntries():
	var jsonDict = {
		"KIT_PART": {   "TOTAL"     : 0
					   ,"MEAT"      : {   "BASE":0 , "MOD":0 ,"APPENDIX":0  , "TOTAL":0   }
					   ,"MAGIC"     : {   "BASE":0 , "MOD":0 ,"APPENDIX":0  , "TOTAL":0   }
					   ,"MATRIX"    : {   "BASE":0 , "MOD":0 ,"APPENDIX":0  , "TOTAL":0   }},
		"TILES"                     : 0,
		"INTERACTABLES"             : 0,
		"Cheat/Commands"            : 0,
		"COMMANDS"                  : 0}
	
	
	for key in Alecandria.LECDistribuution.keys()     : jsonDict[key] = Alecandria.LECDistribuution[key]
	for entry in API_008_CLI.getAllCmdMeta().values() : jsonDict["COMMANDS"] += 1
	
	for entry in API_001_Atlas.KitParts().getEntries():
		var part = ENUM.KITS.PARTS.keys()[API_001_Atlas.KitParts().getEntry(entry).partType()]
		var mType = API_001_Atlas.KitParts().getEntry(entry).mType()
		jsonDict["KIT_PART"]["TOTAL"]         += 1
		jsonDict["KIT_PART"][mType]["TOTAL"]  += 1
		jsonDict["KIT_PART"][mType][part]     += 1
	
	for entry in API_001_Atlas.Tiles().getEntries().values():
		if !entry.hasFlag("F_1_INTERACTABLE_TYPE") : jsonDict["INTERACTABLES"] += 1
		else                                       : jsonDict["TILES"]         += 1
	
	
	Utils.json().saveDictAsJSON("res://GameData/StatisticsSummary.json",jsonDict)
	




