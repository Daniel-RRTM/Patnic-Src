extends Node
class_name Alecandria_LecToEnt_Pairing
 

static func run(structureType:String,fileContent:Array):
	var lecMetaData    = ENUM.LEC.TYPES_METADATA[structureType]
	var test = Alecandria_Util_ArrayScoper.getMetaSection(fileContent)
	var metaDict = Alecandria_LecToEnt_Saniticer.saniticeMetaSection(test)
	var mainDict = parseMain(Alecandria_Util_ArrayScoper.getMainSection(fileContent))
	
	if isValid(lecMetaData,mainDict):
		var entToFill = initialiceEntity(lecMetaData,metaDict,mainDict)
		match metaDict["USE"]:
			"KITPART_BASE"      : API_001_Atlas.KitParts().addEntity(entToFill)
			"KITPART_MOD"       : API_001_Atlas.KitParts().addEntity(entToFill)
			
			"ACTOR_ROLE"        : API_001_Atlas.Role().addEntity(entToFill)
			"ACTOR_RACE"        : API_001_Atlas.Race().addEntity(entToFill)
			"ACTOR_SPECIALTY"   : API_001_Atlas.Specialties().addEntity(entToFill)





enum SCOPE{  TOP , FLAGS , COMPS , INNER_DICTS,PROPERTIES}
static func parseMain(lecContent:Array) -> Dictionary :
	var ref       = {"COMPONENTS":{},"FLAGS":[]}
	var innerDict = {}
	var state     = SCOPE.TOP
	
	for line in lecContent:
		
		if   "COMPONENTS" in line : state = SCOPE.COMPS
		elif "vvvv"       in line : state = SCOPE.INNER_DICTS
		elif "FLAGS"      in line : state = SCOPE.FLAGS
		elif "PROPERTIES" in line : state = SCOPE.PROPERTIES
		
		
		if   state == SCOPE.COMPS and "--->" in line :   ref = manageCompEntry(line,ref)
		elif "vvvv" in line                          :   ref["COMPONENTS"][Alecandria_LecToEnt_Saniticer.getCompOfEntry(line)] = {}
		elif state == SCOPE.INNER_DICTS              :   ref = manageDictEntry(line,ref,innerDict)
		elif state == SCOPE.FLAGS                    :   ref["FLAGS"].append(Alecandria_LecToEnt_Saniticer.getStringEnum(line))
	#	elif state == SCOPE.PROPERTIES               :   ref["PROPERTIES"].append(Alecandria_LecToEnt_Saniticer.getStringEnum(line))
	
	return ref




static func isValid(lecMetaData:Dictionary,mainDict:Dictionary):
	for compToString in lecMetaData["MANDATORY"]: 
		if !mainDict["COMPONENTS"].keys().has(compToString): 
			printerr("not all mandatory Components in Dictionary for Parsing to Entity! Missing: "+compToString)
			return false
	return true




static func initialiceEntity(lecMetaData:Dictionary,metaDict:Dictionary,mainDict:Dictionary):
	var entToFill = lecMetaData["CLASS"].new()
	
	for flagToString in mainDict["FLAGS"]: entToFill.addFlag(flagToString)
	#for propToString in mainDict["PROPERTIES"]: entToFill.addProperty(propToString)
	
	entToFill.addComponent(C_72_LEC_META_USE.new(metaDict["USE"]))
	entToFill.addComponent(C_71_LEC_META_BY.new(metaDict["BY"]))
	for compToString in mainDict["COMPONENTS"].keys():
		var valueOfComp  = mainDict["COMPONENTS"][compToString]
		var compInstance = DemocrECS.getComponentClass(compToString).new(valueOfComp)
		entToFill.addComponent(compInstance)
	return entToFill








static func manageCompEntry(entry:String,ref:Dictionary) -> Dictionary:
	var compToString = Alecandria_LecToEnt_Saniticer.getCompOfEntry(entry)
	var compValue = Alecandria_LecToEnt_Saniticer.getSingleStep(entry)
	if "AND" in entry : compValue = compValue.split("AND")
	ref["COMPONENTS"][compToString] = compValue
	return ref


static func manageDictEntry(entry:String,ref:Dictionary,dict:Dictionary) -> Dictionary:
	var key   = Alecandria_LecToEnt_Saniticer.getCompOfEntry(entry)
	var value = Alecandria_LecToEnt_Saniticer.getSingleStep(entry)
	ref["COMPONENTS"].values().back()[key]=value
	return ref



