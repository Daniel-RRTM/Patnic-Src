extends Node
class_name Alecandria_LecToEnt_ActorSpawning


static func run(structureType:String,fileContent:Array):
	var ent    = ActorRngTemplateEntity.new()
	
	
	var meta     = Alecandria_Util_ArrayScoper.getMetaSection(fileContent)
	var metaDict = Alecandria_Util_SectionSplitter_Meta.run(meta)
	ent.addComponent(C_72_LEC_META_USE.new(metaDict["USE"]))
	ent.addComponent(C_12_ATLAS_INDEX.new(metaDict["INDEX"]))
	ent.addComponent(C_71_LEC_META_BY.new(metaDict["BY"]))
	
	
	var main     = Alecandria_Util_ArrayScoper.getMainSection(fileContent)
	var mainData = main(main)
	ent.addComponent(C_74_EVENT_MAIN_DICT.new(mainData))
	
	API_001_Atlas.RNGActorTemplate().addEntity(ent)


static func main(lecContent:Array) -> Dictionary :#
	var ref = {"DECLARATION":{}}
	var package = ""
	
	for line in lecContent:
		var saniticed = line.replace(" ","")
		
		
		if saniticed == "MAIN" or saniticed == "GEAR" or saniticed == "CHARACTERISTICS":
			package = saniticed
			ref["DECLARATION"][saniticed] = {}
		
		
		if "--->" in saniticed:
			var split = line.dedent().split("--->") as Array
			var cache = split.pop_front().rstrip(" ")
			ref["DECLARATION"][package][cache] = split.pop_front().replace(" ","").split("AND") as Array
		

	return ref
