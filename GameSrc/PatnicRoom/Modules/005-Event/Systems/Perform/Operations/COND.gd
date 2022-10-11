extends _004_PerformParent
class_name _004_Perform_Condition

# CLASS    COND  --->  INCAPACITATED  --->  LVL 3  AND  DURA 5                   X
# CLASS    COND  --->  INCAPACITATED  --->  DURA 3  AND  LVL 5                   
# CLASS    COND  --->  INCAPACITATED  --->  DURA 3  AND  LVL 5                   

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary,ent) -> void :
	API_006_Condition.attachConditionToEnt(ent, para.condName, para.duration, para.level)



# ----- DOC ------------------------------------------------------------------ ##
		

static func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : 
	parameters.erase("THAN")
	return {	"condName" : parameters[0]        ,
				"duration" : int(parameters[5])   ,
				"level"    : int(parameters[2])   }



func getAutoDoc() -> Dictionary : return {
	"description"  : "instanciates a Condition by set input and attaches it to triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "COND"
	,"inputs"       :  [ 
		["COND_INDEX" , "LVL" , "DURA"]
	 ]
}


