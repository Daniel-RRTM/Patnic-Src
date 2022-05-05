extends Object
class_name _Alecandria_LecToEnt






static func parse() -> void:
	#for filepath in _Alecandria_Util.getLecsInFilepath(ENUM.ALECANDRIA.STABLE_GAME_DATA):
	for filePath in ["res://GameData/Example_Core.lec","res://GameData/Example_ActorRNGTable.lec","res://GameData/Example_Upgrade.lec","res://GameData/Example_Race.lec"]:
		var content          = _Alecandria_Parser_Util.loadContent(filePath)
		content              = _Alecandria_Parser_Util.removeSeparators(content)
		content              = _Alecandria_Parser_Util.scopeSector(content)
		 
		var metaSection      = _Alecandria_Parser_Util.buildMetaStructure(content["META"])
		var mainSection      = _Alecandria_Parser_Util.buildMainStructure(content["MAIN"])
		var referenceSection = _Alecandria_Parser_Util.buildReferenceSector(content["REFERENCES"])
		
		var ent = _Alecandria_Parser_Util.getEntityByType(metaSection["C_72_LEC_META_USE"])
		ent     = _Alecandria_LecToEnt_PackageMeta.run(metaSection,ent)
		
		for package in mainSection.keys():
			ent =  _Alecandria_Parser_Util.getPackageParserByKeyWord()[package].run(mainSection[package],ent)
			
		
		_Alecandria_Parser_Util.addToAtlas(ent)

































