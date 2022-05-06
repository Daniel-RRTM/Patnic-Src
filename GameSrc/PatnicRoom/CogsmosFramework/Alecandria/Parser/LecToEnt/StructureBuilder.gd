extends Node
class_name _Alecandria_Parser_StructureBuilder

const SECTOR_SEPARATOR  = "//==============================================================================\\\\"
const SECTOR_BEGIN     = "{"
const SECTOR_END       = "}"

const PACKAGE_SEPARATOR = "//------------------------------------------------------------------------------\\\\"
const PACKAGE_BEGIN     = "["
const PACKAGE_END       = "]"

const KEY_VALUE_SEPARATOR = "--->"


static func buildMainStructure(content:Array,toReturn={}) -> Dictionary:
	for line in content: 
		var currentPackage = []
		if PACKAGE_BEGIN in line :  toReturn[line.rstrip(PACKAGE_BEGIN)] = [] 
		elif !PACKAGE_END in line :  
			currentPackage.append(line) ; 
			toReturn.values().back().append(line)
	return toReturn



static func buildMetaStructure(metaData:Array,toReturn={}) -> Dictionary:
	for line in metaData:
		var saniticedMeta = line.replace(" ","").split("--->")
		toReturn[saniticedMeta[0]] = saniticedMeta[1]
	return {   "C_12_ATLAS_INDEX":toReturn["INDEX"] , "C_72_LEC_META_USE":toReturn["USE"] , "C_71_LEC_META_BY":toReturn["BY"]   }



static func buildReferenceStructure(metaData:Array,toReturn={}) -> Dictionary:
	return toReturn
