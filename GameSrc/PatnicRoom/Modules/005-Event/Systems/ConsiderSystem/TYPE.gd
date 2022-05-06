extends _004_ConsiderParent
class_name _004_Consider_Type

# CLASS    THIS --->  TYPE  --->  IS TILE                                       X
# CLASS    THIS --->  TYPE  --->  NOT ACTOR                                     X
# CLASS    THIS --->  TYPE  --->  IS INTERACT                                   X

func run(consideration:Array) -> Array :
	var para = saniticeParameter(consideration)
	var toReturn = []
	

	for ent in API_004_KitSet.selection.selects :   
		var searchedType 
		
		match para.typeName:
			"TILE"     :   searchedType = TileEntity
			"INTERACT" :   searchedType = InteractEntity
			"ACTOR"    :   searchedType = ActorEntity
	
		if   para.operand == "IS"  and  ent is searchedType : toReturn.append(ent)
		elif para.operand == "NOT" and !ent is searchedType : toReturn.append(ent)

	return toReturn





	


func getParameter_quack()     -> Dictionary :   return {}
func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


func saniticeParameter(parameters:Array) -> Dictionary : 
	return {	"typeName" : parameters[3]   ,
				"operand"  : parameters[2]   }


func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "returns selections with the Specific Entity-class"
	,"concept"      : "CONSIDER"
	,"name"         : "TYPE"
	,"inputs"       :  [  ["NOT"] , index ]
}


