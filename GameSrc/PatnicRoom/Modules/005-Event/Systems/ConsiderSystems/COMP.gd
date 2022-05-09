extends _004_ConsiderParent
class_name _004_Consider_Component

# CLASS    THIS --->  COMP  --->  C_65_TIER EQUALLS 1                           X
# CLASS    THIS --->  COMP  --->  C_48_RARITY NOT 10                            X
# CLASS    THIS --->  COMP  --->  C_57_HITPOINTS MORE THAN BISECT               X

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary, toConsider:Array) -> Array :
	var toReturn = []
	for ent in toConsider:
		
		if ent.hasComp(para.compName):
			var compInstance = ent.getComp(para.compName)

			match compInstance.getType_quack():
				"BOOLEAN"   : if validateBoolean(para.value.to_upper(), compInstance.value)      : toReturn.append(ent)      
				"INTEGER"   : if validateInteger(para.value, compInstance.value, para.operand)   : toReturn.append(ent)
				"STRING"    : if validateString(para.value, compInstance.value)                  : toReturn.append(ent)
				"CONTAINER" : printerr("CONSIDERING AN CONTAINER/DICTIONARY COMPONENT IS NOT IMPLEMENTED YET")
				"ARRAY"     : printerr("CONSIDERING AN ARRAY COMPONENT IS NOT IMPLEMENTED YET")
				"NULL"      : printerr("CONSIDERING AN NULL COMPONENT IS NOT IMPLEMENTED YET")
	
	return toReturn


static func validateInteger(parameter, component, dataType:String) -> bool :
	match dataType:
		"EQUALLS" : return int(parameter) == int(component) 
		"NOT"     : return int(parameter) != int(component) 
		"MORE"    : return int(parameter) >  int(component)
		"LESS"    : return int(parameter) <  int(component) 
		_         : return false


static func validateString(parameter, component) -> bool :
	return str(parameter) == str(component)


static func validateBoolean(parameter, component) -> bool :
	return parameter == "TRUE" and component or parameter == "FALSE" and !component



# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String :   return "has [color=lime]Condition [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : return {	
		 "compName" : parameters[0]
		,"operand"  : parameters[1]
		,"value"    : parameters.pop_back()   
	}


static func getAutoDoc() -> Dictionary : return {
	 "description"  : "returns selections with true condition, Entities who dont have the Component are deselected!"
	,"concept"      : "CONSIDER"
	,"name"         : "COMP"
	,"inputs"       :  [ "Component" , ["NOT","EQUALS","LESS","MORE"] , "Value" ]
}


