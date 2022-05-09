extends _004_ConsiderParent
class_name _004_Consider_PropertyAlt

# CLASS    THIS --->  PROP  --->  BURNABLE                                      X
# CLASS    THIS --->  PROP  --->  WET                                           X
# CLASS    THIS --->  PROP  --->  NOT CONDUCTING                                X

static func run(para:Dictionary, toConsider:Array) -> Array :
	var toReturn = []
	var cachedProperties = PROPERTIES.OF
	for ent in toConsider :   
		
		if   para.operand == "HAS"  and  ent.hasProperty(para.value)  :  toReturn.append(ent)
		elif para.operand == "NOT"  and !ent.hasProperty(para.value)  :  toReturn.append(ent)

	return toReturn




func getParameter_quack()     -> Dictionary :   return {}
func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


static func convertArrayToDict(parameters:Array) -> Dictionary : 
	return {	"propName" : parameters[1]   ,
				"operand"  : parameters[0]   ,
				"value"    : DemocrECS.getPropertyEnumNr(parameters[1])   }


static func getAutoDoc() -> Dictionary : return {
	 "descriiption" : "returns selections with the Propperty!"
	,"concept"      : "CONSIDER"
	,"name"         : "PROP"
	,"inputs"       :  [  ["NOT"] , PROPERTIES.OF ]
}


