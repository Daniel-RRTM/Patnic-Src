extends Node
class_name _011_Utils



static func generateCharPreset() -> void:
	var dictOfCharGenerall = Utils.json().fileToDictionary(ENUM.FILE_PATHS.SAVE_STATE+"/one/generall and stats.json")
	var dictOfCharInventory = Utils.json().fileToDictionary(ENUM.FILE_PATHS.SAVE_STATE+"/one/Inventory.json")
	
	dictOfCharGenerall["Gear"] = dictOfCharInventory["Gear"]
	dictOfCharGenerall["Kits"] = dictOfCharInventory["Kits"]
	
	dictOfCharGenerall.erase("//C1")
	dictOfCharGenerall.erase("//C2")
	dictOfCharGenerall.erase("//C3")
	
	API_003_Player.chargenSelecttion = dictOfCharGenerall




static func loadStartingKits(playerEnt) -> void:
	if API_003_Player.startingKitsets is Array:
		for kitset in API_003_Player.startingKitsets:
			if kitset.count("NULL") != 3:
				var kitsetArr = []

				for kitpart in kitset:
					if kitpart != "" :   kitsetArr.append(API_001_Atlas.KitParts().getEntryByName(kitpart))
					else             :   kitsetArr.append("Null")

				var kitsetEnt = API_004_KitSet.getMergedKitsets(kitsetArr)
				playerEnt.kitventory().kitsets().append(kitsetEnt)


