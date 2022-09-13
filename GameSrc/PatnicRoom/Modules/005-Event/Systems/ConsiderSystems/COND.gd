extends _004_ConsiderParent
class_name _004_Consider_Condition

# CLASS    THIS --->  COND  --->  IS BURNING                                    X
# CLASS    THIS --->  COND  --->  BURNING AND LESS THAN LVL 4                   X
# CLASS    THIS --->  COND  --->  BURNING AND MORE THAN LVL 4                   X
# CLASS    THIS --->  COND  --->  NOT WET                                       X

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary, toConsider:Array) -> Array :
	var toReturn = []
	for ent in toConsider:
		
		match para.operand:
			"IS"   : if  ent.hasCond(para.condName)                                      : toReturn.append(ent)
			"NOT"  : if !ent.hasCond(para.condName)                                      : toReturn.append(ent)
			_      : if validateConditionEntity(para, ent.conditions.get(para.condName)) : toReturn.append(ent)
	
	return toReturn




static func validateConditionEntity(para:Dictionary, cond:ConditionEntity) -> bool:
	var condValueToCompare = cond.level if para.toCompare == "LVL" else cond.duration
	match para.operand:
		"MORE" : return condValueToCompare > int(para.value)
		"LESS" : return condValueToCompare < int(para.value)
		_      : return false



# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String :   return "has [color=lime]Condition [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : 
	parameters.erase("THAN")
	if parameters.has("MORE") or parameters.has("LESS") : return {	
			 "condName"    : parameters[0]
			,"operand"     : parameters[2]
			,"toCompare"   : parameters[3]
			,"compareWith" : parameters[4] 
		}
	else : return {	
			 "condName"    : parameters[1]
			,"operand"     : parameters[0]   
		}


static func getAutoDoc() -> Dictionary : return {
	 "description" : "returns valid entities, which have have (not) the condition or even a its compared value in LVL or DURA!"
	,"concept"      : "CONSIDER"
	,"name"         : "COND"
	,"inputs"       :  [ 
		[ ["NOT","IS"] , "COND_INDEX"],
		[ "COND_INDEX" , ["NOT","EQUALS","LESS","MORE"] , ["LVL","DURA"] , "Value"]
	]
}


