extends Object
class_name _Alecandria_LecToEnt






static func parse() -> void:
	#for filepath in _Alecandria_Util.getLecsInFilepath(ENUM.ALECANDRIA.STABLE_GAME_DATA):
	for filePath in _Alecandria_Util.getLecsInFilepath(ENUM.ALECANDRIA.STABLE_GAME_DATA):
		var rawData          = _Alecandria_Parser_Util.loadContent(filePath)
		var content              = _Alecandria_Parser_Util.removeSeparators(rawData)
		content              = _Alecandria_Parser_Util.scopeSector(content)
		 
		var metaSection      = _Alecandria_Parser_StructureBuilder.buildMetaStructure(content["META"])
		var mainSection      = _Alecandria_Parser_StructureBuilder.buildMainStructure(content["MAIN"])
		var referenceSection = _Alecandria_Parser_StructureBuilder.buildReferenceStructure(content["REFERENCES"])
		
		var ent = _Alecandria_Parser_Util.getEntityByType(metaSection["C_72_LEC_META_USE"])
		ent     = _Alecandria_LecToEnt_PackageMeta.run(metaSection,ent)
		
		for package in mainSection.keys():
			ent =  _Alecandria_Parser_Util.getPackageParserByKeyWord()[package].run(mainSection[package],ent)
			ent.addComponent(C_14_LEC_RAW_DATA.new(rawData))
		
		_Alecandria_Parser_Util.addToAtlas(ent)








