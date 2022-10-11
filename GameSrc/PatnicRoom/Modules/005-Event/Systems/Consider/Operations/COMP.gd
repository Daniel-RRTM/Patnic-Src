extends _004_ConsiderParent
class_name _004_Consider_Component

# CLASS    THIS --->  COMP  --->  C_65_TIER EQUALLS 1                           X
# CLASS    THIS --->  COMP  --->  C_48_RARITY NOT 10                            X
# CLASS    THIS --->  COMP  --->  C_57_HITPOINTS MORE THAN BISECT               X

# ----- PROCESS -------------------------------------------------------------- ##

# REFACTOR 
static func run(para:Dictionary, toConsider:Array) -> Array :
	var toReturn = []
	for ent in toConsider:
		if ent.hasComp(para.compName):
			var compInstance = ent.getComp(para.compName)
			var toCompare = para.value
			
			#if !DemocrECS.getAllComponents().keys().has(para.value) and ent.hasComp(para.value): toCompare.getCompValue(para.value)
			
			if !para.value is Array: para.value = [para.value]
			
			for possibleValue in para.value:
			
				match compInstance.getType_quack():
					"BOOLEAN"   : if validateBoolean(possibleValue.to_upper(), compInstance.value)      : toReturn.append(ent)      
					"INTEGER"   : if validateInteger(possibleValue, compInstance.value, para.operand)   : toReturn.append(ent)
					"STRING"    : if validateString(possibleValue, compInstance.value)                  : toReturn.append(ent)
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


static func convertArrayToDict(parameters:Array) -> Dictionary : 
	if parameters.has("AND"):
		parameters.erase("AND")
		var toReturn = {}
		toReturn["compName"] = parameters.pop_front()
		toReturn["operand"] = parameters.pop_front()
		toReturn["value"] = parameters
		return toReturn
	else:
		return {	
		 "compName" : parameters[0]
		,"operand"  : parameters[1]
		,"value"    : parameters.pop_back()   
	}




func getAutoDoc() -> Dictionary : return {
	 "keyword"      : "COMP"
	,"opertion"     : ["THIS","AND","OR"]
	,"concept"      : "CONSIDER"
	
	,"description"  : "returns valid entities, which have the corespondig value in their Component"
	
	,"validSteps"   : [  
		{   "name":"compIndex"  , "type":"STRING" , "selection":[DemocrECS.getAllComponents()]   },
		{   "name":"comparator" , "type":"STRING" , "selection":["NOT","EQUALS","LESS","MORE"]   },
		[
			{   "name":"value"     , "type":"STRING" , "selection":[]                            },
			{   "name":"compIndex" , "type":"STRING" , "selection":[DemocrECS.getAllComponents()]}
		]
	]
	
}