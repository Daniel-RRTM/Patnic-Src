extends Node
class_name Alecandria_Parser_LecToEnt_Hub



static func parseGameData():
	var eventsToParse   = []
	
	for filepath in _Alecandria_Util.getLecsInFilepath(ENUM.ALECANDRIA.STABLE_GAME_DATA):
		
		var content = Alecandria_Util_FileConverter.run(filepath)
		var useType = Alecandria_Util_ArrayScoper.getUseType(content)
		
		
		for structure in ENUM.LEC.STRUCTURE_BY_TYPE:
			var structName = structure["NAME"]
			if structure["CONTENT"].has(useType):
				
				if useType == "EVENT" : eventsToParse.append(content)
				else                  : structure["PARSER"].run(useType,content)
	
	for fileContent in eventsToParse :   Alecandria_LecToEnt_Event.run("EVENT",fileContent)

