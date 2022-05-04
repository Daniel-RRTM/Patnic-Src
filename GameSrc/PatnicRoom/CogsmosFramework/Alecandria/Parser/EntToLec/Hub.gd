extends Node
class_name Alecandria_Parser_EntToLec_Hub





static func parseEntToString(ent) -> String:
	var entToString = ""
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getMeta(ent)
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getSection()
	
	match ent.getCompValue("C_72_LEC_META_USE"):
		"EVENT" : entToString += Alecandria_Parser_EntToLec_EventToString.run(ent)
		_                    : entToString += Alecandria_Parser_EntToLec_CommonToString.run(ent)
		
	
	
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getSection()
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getReference(ent)
	
	return entToString
















