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
	var dict       = Utils.json().fileToDictionary(filePath+"/common.json")

	# STUB
	entContent["C_9_CREDITS_ACCOUNT"]                     = dict["credits"]
	#entContent["C_X_ARCHIVEMENTS"]                       = dict["archivements"]
	#entContent["C_X_RESSOURCES"]                         = dict["ressources"]
	#entContent["C_X__005_Common_Cloudprinter_INVENTORY"] = dict["_005_Common_Cloudprinter storage"]
	#entContent["C_X_UNICYCLER_LICENSES"]                 = dict["unicycler licenses"]

	var cacheAlt = []
	for kitIndex in dict.kitventory:   cacheAlt.append(API_001_Atlas.KitParts().getEntry(kitIndex))
	entContent["C_68_KITVENTORY"] = cacheAlt

	return entContent




static func loadChar(filePath:String, nr:int, entContent={}):
	var compsToLoad = [	"C_45_CHARACTER_NAME"      , "C_44_STREETNAME"  , "C_11_RACE_NAME"        , "C_12_ATLAS_INDEX" ,
						"C_19_ATTRIBUTES"          , "C_20_SKILLBLOCK"  , "C_51_PLAYER_KITSETS"   , "C_25_MAX_KITSETS" ,
						"C_39_KITSLOT_PROGRESSION" , "C_46_ACTOR_ITEMS" , "C_41_PERK_PROGRESSION"                      ]
	var dictOfChar  = Utils.json().fileToDictionary(filePath+"/Char"+str(nr)+".json")

	for compToString in compsToLoad :
		var configKey = DemocrECS.getComponentClass(compToString).getAutoDoc().configKey
		entContent[compToString] = dictOfChar[configKey]

	return entContent











