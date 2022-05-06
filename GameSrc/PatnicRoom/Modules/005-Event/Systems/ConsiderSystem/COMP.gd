extends _004_ConsiderParent
class_name _004_Consider_Component

# CLASS    THIS --->  COMP  --->  C_65_TIER EQUALLS 1                           X
# CLASS    THIS --->  COMP  --->  C_48_RARITY NOT 10                            X
# CLASS    THIS --->  COMP  --->  C_57_HITPOINTS MORE THAN BISECT               X

func run(consideration:Array) -> Array :
	var para = saniticeParameter(consideration)
	var toReturn = []
	
	for ent in API_004_KitSet.selection.selects:
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








func getValueToString_quack() -> String     :   return "has [color=lime]Condition [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


func saniticeParameter(parameters:Array) -> Dictionary : 
	return {	"compName" : parameters[2]   ,
				"operand"  : parameters[3]   ,
				"value"    : parameters[5]   }


func getAutoDoc() -> Dictionary : return {
	 "description" : "returns selections with true condition, Entities who dont have the Component are deselected!"
	,"concept"      : "CONSIDER"
	,"name"         : "COMP"
	,"inputs"       :  [DemocrECS.getAllComponents() , ["NOT","EQUALS","LESS","MORE"] , "dynamic typed value" ]
}


