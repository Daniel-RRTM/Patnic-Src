extends _004_PerformParent
class_name _004_Perform_UniqueStatmod

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary,ent) -> void :
	API_007_Statmod.manageUniqueStatmod(ent,para.type,para.parameter)



# ----- DOC ------------------------------------------------------------------ ##
		

static func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : return {
		 "type"      : parameters.pop_front()
		,"parameter" : parameters
	}



func getAutoDoc() -> Dictionary : return {
	"description"  : "runs a unique statmod on triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "UNIQ"
	,"valids"       : [
		["UNIQ_INDEX" , ["further parameter vary drasticly by the used statmod!"]]
	]
}
 
