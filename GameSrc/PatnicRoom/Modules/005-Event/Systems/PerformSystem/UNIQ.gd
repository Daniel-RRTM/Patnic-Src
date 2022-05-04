extends _004_PerformParent
class_name _004_Perform_UniqueStatmod


func run(perfomance:Array) -> void :
	var operationName = perfomance.pop_front() 
	for ent in API_004_KitSet.selection.triggers :   
		API_007_Statmod.manageUniqueStatmod(ent,operationName,perfomance)
		#SYNTAX.EVENT.STAT_MODS[perfomance[0]].run(ent,perfomance)





		



func getParameter_quack()     -> Dictionary :   return {}
func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


func saniticeParameter(parameters:Array) -> Dictionary : 
	return {  "statMod" : parameters[2]  }



func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "runs a unique statmod on triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "UNIQ"
	,"valids"       : [ API_007_Statmod.getStatModNames() , ["further parameter vary drasticly by the used statmod!"] ]
}
 
