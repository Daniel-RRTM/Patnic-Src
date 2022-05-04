extends _004_ConsiderParent
class_name _004_Consider_Property

# CLASS    THIS --->  PROP  -->  BURNABLE                                      X
# CLASS    THIS --->  PROP  -->  WET                                           X
# CLASS    THIS --->  PROP  -->  NOT CONDUCTING                                X

func run(consideration:Array) -> Array :
	var para = saniticeParameter(consideration)
	var toReturn = []
	var cachedProperties = PROPERTIES.OF
	
	for ent in API_004_KitSet.selection.selects :   
		if   para.operand == "HAS"  and  ent.hasProperty(cachedProperties[para.flagName])  :  toReturn.append(ent)
		elif para.operand == "NOT"  and !ent.hasProperty(cachedProperties[para.flagName])  :  toReturn.append(ent)

	return toReturn




func getParameter_quack()     -> Dictionary :   return {}
func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


func saniticeParameter(parameters:Array) -> Dictionary : 
	return {	"propName" : parameters[1]   ,
				"operand"  : parameters[2]   ,
				"value"    : parameters[3]   }


func getAutoDoc() -> Dictionary : return {
	 "descriiption" : "returns selections with the Propperty!"
	,"concept"      : "CONSIDER"
	,"name"         : "PROP"
	,"inputs"       :  [  ["NOT"] , PROPERTIES.OF ]
}


