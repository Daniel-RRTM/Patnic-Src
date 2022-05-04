extends Node
class_name Alecandria_LecToEnt_Event

 
static func run(structureType:String,fileContent:Array):
	var eventEnt    = EventEntity.new()
	var metaDict = Alecandria_LecToEnt_Saniticer.saniticeMetaSection(Alecandria_Util_ArrayScoper.getMetaSection(fileContent))
	var main      = Alecandria_Util_ArrayScoper.getMainSection(fileContent)
	var mainData = getDictOfSectionString(main)
	
	eventEnt.addComponent(C_72_LEC_META_USE.new(metaDict["USE"]))
	eventEnt.addComponent(C_71_LEC_META_BY.new(metaDict["BY"]))
	eventEnt.addComponent(C_12_ATLAS_INDEX.new(metaDict["INDEX"]))
	
	for package in mainData.values():
		for concept in package.values():
			for step in concept:
				for arrow in  ["--->","-->","->"] : step.erase(arrow)
	
	eventEnt.addComponent(C_74_EVENT_MAIN_DICT.new(mainData))
	var atlasEntry = API_001_Atlas.KitParts().getCachedEntry(eventEnt.index())
	atlasEntry.getComp("C_49_EVENT_REFERENCE").value = eventEnt


enum SCOPE{   TOP , PACKAGE , CONCEPT , REFERENCE , STEP   }


static func getDictOfSectionString(lecContent:Array):
	var package ; var concept
	var ref     = {}
	var state   = SCOPE.TOP
	
	for line in lecContent:
		
		
		state = getScopeByIndent(line)
		
		
		# PACKAGE
		if state == SCOPE.PACKAGE:
			state        = SCOPE.PACKAGE
			package      = line.replace("{","").replace(" ","").split("-") as Array
			package      = package.pop_back()
			ref[package] = {}
		
		
		# CONCEPT
		elif state == SCOPE.CONCEPT:   
			state   = SCOPE.CONCEPT
			concept = line.replace("{","").replace(" ","")
			ref[package][concept] = []
		
		
		
		
		else: 
			var content = []
			var toInsert = ""
			
			var splitted = line.split(" ") as Array
			for split in splitted: if !split.empty(): content.append(split)
			
			
			if content.empty() : 
				var saniticed = line.replace(" ","")
				for arrow in ["--->","-->","->"]:
					if toInsert == arrow : toInsert += saniticed.split(arrow).front()
			
			
			else : toInsert = content
			
			
			ref[package][concept].append(toInsert)
	
	
	
	return ref





static func getScopeByIndent(line) : 
	match line.count(" "):
		0 : return SCOPE.TOP
		2 : return SCOPE.PACKAGE
		4 : return SCOPE.CONCEPT
		6 : return SCOPE.STEP


