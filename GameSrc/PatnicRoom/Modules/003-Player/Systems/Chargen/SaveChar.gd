extends Object
class_name _005_SaveChar


static func savePlayState() -> void:
	var filePath = "res://Config/savestate/"
	var name = API_003_Player.currentChar.getCompValue("C_45_CHARACTER_NAME")
	var jsonCrossRef = API_003_Player.getJSONCrossReference()
	
	var dictOfCommon = loadCommon(jsonCrossRef.common)
	var dictOfChar = loadChar(1,jsonCrossRef.character)
	
	Utils.json().saveDictAsJSON("res://Config/savestate/"+name+"/Common.json",dictOfCommon)
	Utils.json().saveDictAsJSON("res://Config/savestate/"+name+"/Char1.json",dictOfChar)





static func loadCommon(jsonCrossRef):
	var dictOfCommon = Utils.json().fileToDictionary("res://Config/savestate/template/common.json")
	for toSave in jsonCrossRef.keys():
		match toSave:
			
			"QUESTS_CYCLE":
				dictOfCommon["quest-cycle"] = API_003_Player.getQuestCycle().atlas
			
			
			"C_68_KITVENTORY":
				dictOfCommon["kitventory"] = []
				for kit in API_003_Player.currentChar.getComp("C_68_KITVENTORY").getKitSetDict().values():
					dictOfCommon["kitventory"].append(kit.index())
			
			_ : dictOfCommon[jsonCrossRef[toSave]] = API_003_Player.currentChar.getCompValue(toSave)
	
	dictOfCommon["station"] = loadStation()
	return dictOfCommon






static func loadStation():
	var toReturn = {}
	var stations = {   
		"Workshop" : API_003_Player.stations.meat,
		"Retreat"  : API_003_Player.stations.magic,
		"Terminal" : API_003_Player.stations.matrix
	}
	
	for stationKey in stations:
		var stationValue = stations[stationKey]
		
		toReturn[stationKey] = {}
		toReturn[stationKey]["mode"]           = stationValue.mode
		toReturn[stationKey]["basekit"]        = []
		toReturn[stationKey]["is ready"]       = stationValue.currentLength
		toReturn[stationKey]["max length"]     = stationValue.maxLength
		toReturn[stationKey]["kitpart to mod"] = []
		toReturn[stationKey]["current length"] = stationValue.currentLength
		
		if stationValue.isCounting:
			var currentKit = []
			if is_instance_valid(stationValue.kitset.base)     : currentKit.append(stationValue.kitset.base.index())     ; else: currentKit.append("")
			if is_instance_valid(stationValue.kitset.mod)      : currentKit.append(stationValue.kitset.mod.index())      ; else: currentKit.append("")
			if is_instance_valid(stationValue.kitset.appendix) : currentKit.append(stationValue.kitset.appendix.index()) ; else: currentKit.append("")
			toReturn[stationKey]["basekit"]        = currentKit
			toReturn[stationKey]["kitpart to mod"] = stationValue.kitpartToMod.index()
	
	return toReturn
	


static func loadChar(charNr,jsonCrossRef):
	var dictOfChar  = Utils.json().fileToDictionary("res://Config/savestate/Template/Char1.json")
	for toSave in jsonCrossRef.keys():
		match toSave:


			"C_51_PLAYER_KITSETS":
				dictOfChar[jsonCrossRef[toSave]] = []
				for kitset in API_003_Player.currentChar.getComp("C_51_PLAYER_KITSETS").getKitSetDict().values():
					var currentKit = []
					if is_instance_valid(kitset.base): currentKit.append(kitset.base.index()); else: currentKit.append("")
					if is_instance_valid(kitset.mod): currentKit.append(kitset.mod.index()); else: currentKit.append("")
					if is_instance_valid(kitset.appendix): currentKit.append(kitset.appendix.index()); else: currentKit.append("")
					dictOfChar[jsonCrossRef[toSave]].append(currentKit)

			_ : dictOfChar[jsonCrossRef[toSave]] = API_003_Player.currentChar.getCompValue(toSave)

	return dictOfChar



