extends _004_ConsiderParent
class_name _004_Consider_Flag

# CLASS    THIS --->  FLAG  -->  NOT F_CHEAT_1_NO_CLIP                         X
# CLASS    THIS --->  FLAG  -->  HAS F_1_INTERACTABLE_TYPE                     X
# CLASS    THIS --->  FLAG  -->  HAS F_8_IS_WALL                               X

func run(consideration:Array) -> Array :
	var para = saniticeParameter(consideration)
	var toReturn = []
	
	for ent in API_004_KitSet.selection.selects :
		if   para.operand == "HAS"  and  ent.hasFlag(para.flagName)  :  toReturn.append(ent)
		elif para.operand == "NOT"  and !ent.hasFlag(para.flagName)  :  toReturn.append(ent)

	return toReturn




func getParameter_quack()     -> Dictionary :   return {}
func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


func saniticeParameter(parameters:Array) -> Dictionary : 
	return {	"flagName" : parameters[3]   ,
				"operand"  : parameters[2]   }


func getAutoDoc() -> Dictionary : return {
	 "descriiption" : "returns selections with the Flag!"
	,"concept"      : "CONSIDER"
	,"name"         : "FLAG"
	,"inputs"       :  [  ["NOT"] , _Flags.getFlags() ]
}


