extends Node
class_name Alecandria_Parser_EntToLec_CommonToString





static func run(ent) -> String :
	var entToString = "MAIN\n"
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getPackage()
	entToString += getComps(ent)
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getPackage()
	entToString += getArray(ent.flags,"  FLAGS")
	entToString += Alecandria_Parser_EntToLec_UniversalToString.getPackage()
	entToString += getArray(ent.properties,"  PROPERTIES")
	
	return entToString



# STUB 
static func getComps(ent) -> String :
	var toReturn = "  COMPONENTS\n"
	var comps = ent.components
	
	for compToString in comps.keys():
		var compValue = ent.getCompValue(compToString)
		
		toReturn += "    "
		toReturn += compToString
		for i in range(compToString.length()-30,0): toReturn += " "
		toReturn += "--->    "
		
		if is_instance_valid(compValue) : toReturn += getSpecificCompInfo(compValue)+"\n"
		else                            : toReturn += str(compValue)+"\n"
	
	return toReturn




static func getSpecificCompInfo(compValue) -> String :
	if compValue is EventEntity :   return compValue.getCompValue("C_12_ATLAS_INDEX")
	return compValue




static func getArray(arr:Array,packageName:String) -> String :
	var toReturn = packageName+"\n"
	
	for compToString in arr:
			toReturn += "    "
			toReturn += compToString
			toReturn += "\n"
	
	return toReturn







