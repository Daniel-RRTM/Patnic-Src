extends Node
class_name Alecandria_Parser_EntToLec_UniversalToString

const SECTION_SEPARATOR = "//----------------------------------------------------------------------------\\\\"
const PACKAGE_SEPARATOR = "//-------\\\\"


static func getSection() -> String :   return "\n\n\n"+SECTION_SEPARATOR+"\n"+SECTION_SEPARATOR+"\n"+SECTION_SEPARATOR+"\n"+"\n\n"
static func getPackage() -> String :   return "\n"+PACKAGE_SEPARATOR+"\n\n"


static func getMeta(ent) -> String :
	var toReturn = "\n\n"
	toReturn += "META\n"
	toReturn += "  INDEX    --->  "
	toReturn += ent.getCompValue("C_12_ATLAS_INDEX")
	toReturn += "\n"
	toReturn += "  USE      --->  "
	toReturn += ent.getCompValue("C_72_LEC_META_USE")
	toReturn += "\n"
	toReturn += "  BY       --->  "
	toReturn += ent.getCompValue("C_71_LEC_META_BY")
	toReturn += "\n"
	return toReturn 



static func getReference(ent) -> String :
	var toReturn = "REFERENCE\n\n\n"
	toReturn    += "END\n\n\n"
	return toReturn 
