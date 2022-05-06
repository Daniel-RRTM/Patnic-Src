extends _004_ConsiderParent
class_name _004_Consider_Condition

# CLASS    THIS --->  COND  --->  IS BURNING                                    X
# CLASS    THIS --->  COND  --->  BURNING AND LESS THAN LVL 4                   X
# CLASS    THIS --->  COND  --->  BURNING AND MORE THAN LVL 4                   X
# CLASS    THIS --->  COND  --->  NOT WET                                       X

func run(consideration:Array) -> Array :
	var para = saniticeParameter(consideration)
	var toReturn = []
	
	for ent in API_004_KitSet.selection.selects:

		match para.operand:
			"IS"   : if  ent.hasCond(para.condName)                                      : toReturn.append(ent)
			"NOT"  : if !ent.hasCond(para.condName)                                      : toReturn.append(ent)
			_      : if validateConditionEntity(para, ent.conditions.get(para.condName)) : toReturn.append(ent)
	

	return toReturn




func validateConditionEntity(para:Dictionary, cond:ConditionEntity) -> bool:
	var condValueToCompare = cond.level if para.toCompare == "LVL" else cond.duration
	match para.operand:
		"MORE" : return condValueToCompare > int(para.value)
		"LESS" : return condValueToCompare < int(para.value)
		_      : return false











func getParameter_quack()     -> Dictionary :   return {}
func getValueToString_quack() -> String     :   return "has [color=lime]Condition [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


func saniticeParameter(parameters:Array) -> Dictionary : 
	parameters.erase("THAN")
	
	if parameters.has("MORE") or parameters.has("LESS"): 
		return {	"condName"    : parameters[2]  ,
					"operand"     : parameters[4]  ,
					"toCompare"   : parameters[5]  ,
					"compareWith" : parameters[6] ,}
	
	else : return {	"condName" : parameters[3]   ,
					"operand"  : parameters[2]   }


func getAutoDoc() -> Dictionary : return {
	 "descriiption" : "returns selections with true condition!"
	,"concept"      : "CONSIDER"
	,"name"         : "COND"
	,"inputs"       :  [ API_001_Atlas.Condition.getEntries() , ["NOT","EQUALS","LESS","MORE"] ,["LVL","DURA"],"int" ]
}


