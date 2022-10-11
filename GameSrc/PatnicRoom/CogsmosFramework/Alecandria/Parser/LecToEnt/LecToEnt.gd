extends Object
class_name _Alecandria_LecToEnt



static func parse() -> void:
	var sumParsed = 0
	var refToBuildLater = []
	
	for filePath in _Alecandria_Util.getLecsInFilepath(ENUM.ALECANDRIA.STABLE_GAME_DATA):
		var rawData          = _Alecandria_Parser_Util.loadContent(filePath)
		var content          = _Alecandria_Parser_Util.removeSeparators(rawData)
		content              = _Alecandria_Parser_Util.scopeSector(content)
		
		var metaSection      = _Alecandria_Parser_StructureBuilder.buildMetaStructure(content["META"])
		var mainSection      = _Alecandria_Parser_StructureBuilder.buildMainStructure(content["MAIN"])
		var referenceSection = _Alecandria_Parser_StructureBuilder.buildReferenceStructure(content["REFERENCES"])
		
		Alecandria.LECDistribuution["TOTAL_LEC"] += 1
		if Alecandria.LECDistribuution.has(metaSection["C_72_LEC_META_USE"]) : Alecandria.LECDistribuution[metaSection["C_72_LEC_META_USE"]] += 1
		else                                                                 : Alecandria.LECDistribuution[metaSection["C_72_LEC_META_USE"]]  = 1

		if !content["REFERENCES"].empty():refToBuildLater.append([metaSection,mainSection,referenceSection,filePath])
		
		else:
			var ent = _Alecandria_Parser_Util.getEntityByType(metaSection["C_72_LEC_META_USE"])
			ent     = _Alecandria_LecToEnt_PackageMeta.run(metaSection,ent)
			
			for package in mainSection.keys():
				ent =  _Alecandria_Parser_Util.getPackageParserByKeyWord()[package].run(mainSection[package],ent)
				ent.addComponent(C_14_LEC_RAW_DATA.new(rawData))
				
			sumParsed += 1
			_Alecandria_Parser_Util.addToAtlas(ent,filePath)
	
	
	for data in refToBuildLater:
		var dict = {}
		for templ in data[1]["COMPONENTS"]:
			var keyVal = templ.split(" ---> ")
			dict[keyVal[0]] = keyVal[1]
			data[1]["COMPONENTS"] = dict
		
		var ent = API_010_ProcGen_Actor.createConnectionFromActor(data)
		sumParsed += 1
		_Alecandria_Parser_Util.addToAtlas(ent,data[3])
	
	
	HomErrorLog.printIntoSeshLog("INIT","[color=lime]"+str(sumParsed)+"[color=white] LECs Parsed")




