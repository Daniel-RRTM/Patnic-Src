extends _004_PerformParent
class_name _004_Perform_Commando

# CLASS    COMP  --->  C_1_IS_WALKABLE SET TRUE                                X
# CLASS    COMP --->  C_9_CREDITS_ACCOUNT DECREMENT BY 100                     X
# CLASS    COMP --->  C_48_RARITY INCREMENT BY 2                               X

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary,ent) -> void :
	var cmd = para.cmd.to_lower().replace("_"," ")
	API_008_CLI.processCmdRaw(cmd,para.parameter)



# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : 
	return {	"cmd"        : parameters.pop_front()   ,
				"parameter"  : parameters   }



func getAutoDoc() -> Dictionary : return {
	"description"  : "manipulates a Component of triggered selection"
	,"concept"      : "CONSIDER"
	,"name"         : "TYPE"
	,"inputs"       :  [
		[ "COMP_INDEX" , ["SET","INCREMENT","DECREMENT"] , "dynamic typed value" ]
	]
}


