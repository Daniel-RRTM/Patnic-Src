extends Node
class_name _005_LoadChar


# ----- GENERATE ------------------------------------------------------------- ##


static func generateNewSaveState(chargenDict:Dictionary) -> void:
	var basePath      = "res://Config/savestate/"
	var selectedPath  = basePath+chargenDict["name"]

	var dirManager    = Directory.new().make_dir(selectedPath)
	var fileManager   = File.new()
	
	var commonContent = Utils.json().fileToDictionary(basePath+"template/common.json")
	
	fileManager.open(selectedPath+"/common.json",File.WRITE)
	fileManager.store_string(JSON.print(commonContent,"\t"))
	fileManager.close()
	
	fileManager.open(selectedPath+"/char1.json",File.WRITE)
	fileManager.store_string(JSON.print(chargenDict,"\t"))
	fileManager.close()
	
	parse(chargenDict,1)



# ----- LOAD ---------------------------------------------------------------- ##


static func parse(chargenDict, charNr:int) -> void:
	var filePath
	if chargenDict is String     : filePath = "res://Config/savestate/"+chargenDict
	if chargenDict is Dictionary : filePath = "res://Config/savestate/"+chargenDict["name"]

	var ent = PlayerEntity.new()
	var compsToLoad = {}


	compsToLoad = loadCommonPart(filePath,compsToLoad)
	compsToLoad = loadChar(filePath,1,compsToLoad)

	for compName in compsToLoad.keys():
		var compInstance = DemocrECS.getComponentClass(compName).new(compsToLoad[compName])
		ent.addComponent(compInstance)
	
	
	ent.inventory.initialice(ent)
	ent.kitventory().initialice(ent)
	ent.stats().initialice(ent)
	API_003_Player.setIndirectStats(ent)
	_011_Utils.loadStartingKits(ent)

	API_003_Player.currentChar = ent



# ----- HELPER --------------------------------------------------------------- ##


static func loadCommonPart(filePath:String, entContent={}):
	var dictToParse = Utils.json().fileToDictionary(filePath+"/common.json")
	var cachedCrossRef = API_003_Player.getJSONCrossReference().common
	
	for compIndex in cachedCrossRef.keys():
		match compIndex:
			
			"C_68_KITVENTORY": 
				entContent[compIndex] = []
				for kit in dictToParse[cachedCrossRef[compIndex]]: 
					entContent[compIndex].append(API_001_Atlas.KitParts().getEntry(kit))
			
			_: 
				entContent[compIndex] = dictToParse[cachedCrossRef[compIndex]]
	
	return entContent




static func loadChar(filePath:String, nr:int, entContent={}):
	var dictToParse    = Utils.json().fileToDictionary(filePath+"/Char"+str(nr)+".json")
	var cachedCrossRef = API_003_Player.getJSONCrossReference().character
	
	for compIndex in cachedCrossRef.keys():
		match compIndex:
			
			_: 
				entContent[compIndex] = dictToParse[cachedCrossRef[compIndex]]
	
	return entContent











