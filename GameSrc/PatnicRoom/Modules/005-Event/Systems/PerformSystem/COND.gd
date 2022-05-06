extends _004_PerformParent
class_name _004_Perform_Condition

# CLASS    COND  --->  INCAPACITATED  --->  LVL 3  AND  DURA 5                   X
# CLASS    COND  --->  INCAPACITATED  --->  DURA 3  AND  LVL 5                   
# CLASS    COND  --->  INCAPACITATED  --->  DURA 3  AND  LVL 5                   

func run(consideration:Array) -> void :
	var para = saniticeParameter(consideration)
	
	for ent in API_004_KitSet.selection.triggers: 
		API_006_Condition.attachConditionToEnt(ent, para.condName, para.duration, para.level)







		

func getParameter_quack()     -> Dictionary :   return {}
func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


func saniticeParameter(parameters:Array) -> Dictionary : 
	parameters.erase("THAN")
	return {	"condName" : parameters[0]        ,
				"duration" : int(parameters[5])   ,
				"level"    : int(parameters[2])   }



func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "instanciates a Condition by set input and attaches it to triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "COND"
	,"inputs"       :  [  API_001_Atlas.Condition.getEntries() , "number as intensity" , "number as duration" ]
}


