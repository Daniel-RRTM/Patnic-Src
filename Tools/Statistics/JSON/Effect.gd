extends Node
class_name Statistics_effectsSyntax_JSON



static func calc():
	
	var toJson      = {}
	var dynamicDocs = []
	
	
	dynamicDocs    += SYNTAX.EFFECT().TRIGGER.SPECIFIC.values()
	dynamicDocs    += SYNTAX.EFFECT().SPACE.SOURCE.values()
	dynamicDocs    += SYNTAX.EFFECT().SPACE.SOURCE.values()
	dynamicDocs    += SYNTAX.EFFECT().SPACE.MEDIUM.values()
	
	dynamicDocs    += SYNTAX.EVENT.STATMOD.values()
	dynamicDocs    += SYNTAX.EVENT.CONDITION.values()
	
	
	for entry in dynamicDocs:
		var doc
		
		if entry is Dictionary:   doc = entry["API"].getDoc()
		else:                     doc = entry.getDoc()
		
		toJson[doc["keyword"]] = doc
	

	for doc in getMType():          toJson[doc["keyword"]] = doc
	for doc in getTriggerBasic():   toJson[doc["keyword"]] = doc
	
	
	
	var file = File.new()
	var compDocToJson = JSON.print(toJson,"\t")
	
	file.open("res://GameData/Alecandria/Syntax/Effect Atlas.json",File.WRITE)
	file.store_line(compDocToJson)
	file.close()
	
	
	
	
	
	
	
	
	var spaceSource = []
	var spaceMedium = []
	var triggerSpecific = []
	
	for entry in SYNTAX.EFFECT()["SPACE"]["SOURCE"].keys(): spaceSource.append(entry)
	for entry in SYNTAX.EFFECT()["SPACE"]["MEDIUM"].keys(): spaceMedium.append(entry)
	for entry in SYNTAX.EFFECT()["TRIGGER"]["SPECIFIC"].keys(): triggerSpecific.append(entry)
	
	
		
	var staticIndexPart={
		"TRIGGER":{   "BASE"      : SYNTAX.EFFECT()["TRIGGER"]["BASE"],
					  "SPECIFIC"  : triggerSpecific
		},
		
		"SPACE":{   "SOURCE"     : spaceSource ,
					"MEDIUM"     : spaceMedium },
		
		"EFFECT":{   "STAT_MOD"  : SYNTAX.EVENT.STATMOD.keys() ,
					 "CONDITION" : SYNTAX.EVENT.CONDITION.keys()    }
	}
	
	
	file.open("res://GameData/Alecandria/Syntax/Effect Index.json",File.WRITE)
	file.store_line(JSON.print(staticIndexPart,"\t"))
	file.close()
	
	
	
	
	var dict = {
		"TILE_SET":API_001_Atlas.TileSetAtlas().keys(),
		"FLAGS": DemocrECS.getAllFlags()
	}
	
	file.open("res://GameData/Alecandria/ListReferences.json",File.WRITE)
	file.store_line(JSON.print(dict,"\t"))
	file.close()
	






static func getMType():
	return [
		{
		"keyword": "MEAT",
		"name": "Meat",
		"unit": "SPACE",
		"stat": "M_TYPE",
		"toString": "Meat",
		"inputModule": "VOID"
		},
		{
		"keyword": "MAGIC",
		"name": "Magic",
		"unit": "SPACE",
		"stat": "M_TYPE",
		"toString": "Magic",
		"inputModule": "VOID"
		},
		{
		"keyword": "MATRIX",
		"name": "Matrix",
		"unit": "SPACE",
		"stat": "M_TYPE",
		"toString": "Matrix",
		"inputModule": "VOID"
		}
	]


static func getTriggerBasic():
	return [
		{
		"keyword": "TILE",
		"name": "TILE",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Ground",
		"inputModule": "VOID"
		},
		{
		"keyword": "ACTOR",
		"name": "ACTOR",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Actors",
		"inputModule": "VOID"
		},
		{
		"keyword": "INTERACT",
		"name": "INTERACT",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Interactables",
		"inputModule": "VOID"
		},
		{
		"keyword": "ALL",
		"name": "ALL",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Interactables and Ground and Actors",
		"inputModule": "VOID"
		},
		{
		"keyword": "INTERACT_ACTOR",
		"name": "INTERACT_ACTOR",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Interactables and Actors",
		"inputModule": "VOID"
		},
				{
		"keyword": "INTERACT_TILE",
		"name": "INTERACT_TILE",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Interactables and Ground",
		"inputModule": "VOID"
		},
				{
		"keyword": "TILE_ACTOR",
		"name": "TILE_ACTOR",
		"unit": "TRIGGER",
		"stat": "BASIC",
		"toString": "Actors and Ground",
		"inputModule": "VOID"
		},
	]







