extends Node
class_name Statistics_JSON_Generall

static func countCategoryEntries():
	var jsonDict = {
		"summary" : {
			"Core Kitparts"     : 0,
			"Upgrade Kitparts"  : 0,
			"Trait Kitparts"    : 0,
			"Tiles"             : 0,
			"Race"              : 0,
			"Role"              : 0,
			"Specialty"         : 0,
			"Conditions"        : 0,
			"ActorRNGTemplates" : 0,
			"Interactables"     : 0,
			"Cheat/Commands"    : 0
		}
	}
	
	
	for entry in API_001_Atlas.KitParts().getEntries():
		match API_001_Atlas.KitParts().getEntry(entry).partType():
			ENUM.KITS.PARTS.BASE: jsonDict["summary"]["Core Kitparts"] += 1
			ENUM.KITS.PARTS.MOD:  jsonDict["summary"]["Upgrade Kitparts"] += 1
			ENUM.KITS.PARTS.APP:  jsonDict["summary"]["Trait Kitparts"] += 1
	
	
	for entry in API_001_Atlas.Tiles().getEntries():
		if API_001_Atlas.Tiles().getEntry(entry).hasFlag("F_1_INTERACTABLE_TYPE"):jsonDict["summary"]["Interactables"] += 1
		else:jsonDict["summary"]["Tiles"] += 1
	
	
	for entry in API_001_Atlas.Race().getEntries()             : jsonDict["summary"]["Race"]       += 1
	for entry in API_001_Atlas.Role().getEntries()             : jsonDict["summary"]["Role"]       += 1
	for entry in API_001_Atlas.Specialties().getEntries()      : jsonDict["summary"]["Specialty"]  += 1
	for entry in API_001_Atlas.Conditions().getEntries()       : jsonDict["summary"]["Conditions"] += 1
	for entry in API_001_Atlas.RNGActorTemplate().getEntries() : jsonDict["summary"]["ActorRNGTemplates"] += 1
	
	for entry in API_008_CLI.getAllCmdMeta().values()          : jsonDict["summary"]["Cheat/Commands"] += 1

	Utils.json().saveDictAsJSON("res://GameData/StatisticsSummary.json",jsonDict["summary"])
	
