extends Node
class_name Statistics_kitparts_JSON







static func calc():
	# VARIABLES   
	var atlas          = API_001_Atlas.KitParts()
	var statDict       = {}
	var statDictSize   = {}
	
	var mType          = ENUM.SOKRATILES.M_TYPE
	var kitPart        = ENUM.KITS.PARTS
	
	var allCategories  = ENUM.KITS.CATEGORIES
	var categoryMatrix = ENUM.KITS.CAT_MATRIX
	var categoryMagic  = ENUM.KITS.CAT_MAGIC
	var categoryMeat   = ENUM.KITS.CAT_MEAT

	var mdWriter       = MarkdownWriter.new()
	


	# PROCEDURE
	
	# --- add Ents --- #
	statDict["allMTypes"]         = addAllOfMType(mType,atlas)
	statDict["BaseModMTypes"]     = addKitsAndModsByMType(mType,atlas,statDict,kitPart)
	statDict["categories"]        = addByCategories(atlas)

	# --- get size --- #
	statDictSize["allMTypes"]     = getSizeOfAllTypes(statDict,mType)
	statDictSize["BaseModMTypes"] = getSizeOfKitsAndMods(statDict,mType)
	statDictSize["categories"]    = getSizeOfCategories(statDict,mType)
	
	
	var file = File.new()
	file.open("res://tools/Statistics/output/Kitparts.json",File.WRITE)
	file.store_line(to_json(statDictSize))
	file.close()




# ---- GET ENTITIES ----

static func addAllOfMType(mType,atlas):
	var dict = {}
	for i in mType.size():
		var cache = mType.keys()[i]
		dict[ cache ] = atlas.getEntriesWithCompValue(cache,"C_37_M_TYPE")
	return dict


static func addKitsAndModsByMType(mType,atlas,statDict,kitpart):
	kitpart = kitpart.keys()
	mType = mType.keys()
	var dict = {}
	for i in mType.size(): 
		dict[ mType[i]+"_"+kitpart[0] ] = atlas.getEntsWithValueOfCompInArray(statDict["allMTypes"][mType[i]].values(), "C_38_KIT_PART_TYPE", "BASE")
		dict[ mType[i]+"_"+kitpart[1] ] = atlas.getEntsWithValueOfCompInArray(statDict["allMTypes"][mType[i/2]].values(), "C_38_KIT_PART_TYPE", "MOD" )
	return dict


static func addByCategories(atlas):
	var dict = {}

	dict["HACK"]      = atlas.hack.values()
	dict["CYBERWARE"] = atlas.cyberware.values()
	dict["DRONE"]     = atlas.drone.values()
	
	dict["ARMOR"]     = atlas.armor.values()
	dict["GUN"]       = atlas.gun.values()
	dict["MEELE"]     = atlas.meele.values()
	
	dict["SPELL"]     = atlas.spell.values()
	dict["INFUSION"]  = atlas.infusion.values()
	dict["RITE"]      = atlas.rite.values()

	return dict









static func getSizeOfAllTypes(statDict,mType):
	var dict = {}
	for i in 3: dict[mType[i]]=""
	
	for i in statDict["allMTypes"].size():
		dict[mType[i]] = statDict["allMTypes"][mType[i]].size()
	
	return dict


static func getSizeOfKitsAndMods(statDict,mType):
	var currentDict = statDict.values()[1]
	var dict = {}
	for i in 3: dict[dict[i]]={}

	for i in currentDict.size()/2: 
		dict[mType[i]]["BASE"] = currentDict[mType[i]+"_BASE"].size()
		dict[mType[i]]["MOD"]  = currentDict[mType[i]+"_MOD"].size()

	return dict


static func getSizeOfCategories(statDict,mType):
	var dict = {}
	for i in statDict["categories"].size():
		var currentKey    = statDict["categories"].keys()[i]
		var currentValues = statDict["categories"].values()[i].size()

		dict[currentKey]  = currentValues

	return dict












static func getEntsWithValueOfCompInArray(arr:Array,comp:String,value):
	var returnArr = []

	for i in arr.size():
		var currentEnt = arr[i]

		if currentEnt.hasComp(comp):
			if currentEnt.getCompValue(comp) == value:

				returnArr.append(currentEnt)
		
	return returnArr
