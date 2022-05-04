extends Node
class_name _TextToolBox_InstanceLoader



static func loadCompsOfForm(rootNode:Node2D,formToLoad:String):
	var form = Utils.json().fileToDictionary("res://GameData/Alecandria/Forms/"+formToLoad)
	rootNode.compInput.clear()

	for i in form["mandatory to fill out"].size():
		var compToString = form["mandatory to fill out"][i]
		var compData     = rootNode.componentsDocs[compToString]
		var rowData     := _TextToolBox_RowMetaData.new(compData,compToString)
		
		rootNode.compInput[i+6]  = rowData
		rootNode.mainTed.add_keyword_color(rowData.nameToShow,Color("#a1d1ff"))




static func loadLECsToBrowse(enumNr):
	var toLoad = {}
	var toReturn = {}
	
	match enumNr:
		FORMS.VOID       : toLoad = {}
		FORMS.RACE       : toLoad = API_001_Atlas.Race().getEntries()
		FORMS.ROLE       : toLoad = API_001_Atlas.Role().getEntries()
		FORMS.SPECIALTY  : toLoad = API_001_Atlas.Specialty().getEntries()
		FORMS.BASE       : toLoad = API_001_Atlas.KitParts().baseKitParts
		FORMS.MOD        : toLoad = API_001_Atlas.KitParts().modKitParts
		#FORMS.APPENDIX   : toLoad = API_001_Atlas.
		#FORMS.CONSUMABLE : toLoad = API_001_Atlas.
		FORMS.EVENT      : toLoad = API_001_Atlas.KitParts().cache
	
	for entry in toLoad.values() : 
		var entName   = entry.getCompValue("C_6_NAME") 
		var saniticed = entName.replace(" ","_").replace("-","_")
		
		toReturn[saniticed] = entry
	
	return toReturn




static func getLECs() -> Dictionary:
	var toReturn = {}
	var LECs     = Alecandria.LECipdedia
	
	for entry in ["ACTOR_RACE","ACTOR_ROLE","ACTOR_SPECIALTY","KITPART_BASE","KITPART_MOD","EVENT_EFFECT"]: 
		toReturn[entry]={}
		
	for value in LECs.values():
			for key in value.keys(): if value[key] is String: value.erase(key)
			var nameOfDict = getComp(value,"C_6_NAME")
			var type = value["ENTITY"].metaData["USE"]
			toReturn[type][nameOfDict] = value
	
	
	return toReturn



static func getComp(entry,compName): 
	var allComps = entry["ENTITY"].mainSection["COMPONENTS"]
	if allComps.has(compName): return allComps[compName]



enum FORMS{         VOID         = 20 ,
					RACE         = 21 ,
					ROLE         = 22 ,
					SPECIALTY    = 23 ,
					BASE         = 24 ,
					MOD          = 25 ,
					APPENDIX     = 26 ,
					CONSUMABLE   = 27 ,
					EVENT        = 28 }


