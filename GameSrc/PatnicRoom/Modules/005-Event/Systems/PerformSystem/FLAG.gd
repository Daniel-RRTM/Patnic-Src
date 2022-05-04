extends _004_PerformParent
class_name _004_Perform_Flag

# CLASS    FLAG  -->  ADD   F_CHEAT_1_NO_CLIP                                   
# CLASS    FLAG  -->  SWAP  F_19_ACTOR_CAN_NOT_MOVE                             
# CLASS    FLAG  -->  REMOVE  F_8_IS_WALL                                       

func run(consideration:Array) -> void :
	var para = saniticeParameter(consideration)
	
	for ent in API_004_KitSet.selection.triggers:
		match para.mode:
			"SWAP"   : if !ent.hasFlag(para.flag) :   ent.addFlag(para.flag);   else : ent.removeFlag(para.flag)  
			"ADD"    : if !ent.hasFlag(para.flag) :   ent.addFlag(para.flag)
			"REMOVE" : if  ent.hasFlag(para.flag) :   ent.removeFlag(para.flag)








			

func getParameter_quack()     -> Dictionary :   return {}
func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 
func getName_quack()          -> String     :   return "HAS_COND"


func saniticeParameter(parameters:Array) -> Dictionary : 
	return {	"flag" : parameters[2]   ,
				"mode" : parameters[3]   }



func getAutoDoc() -> Dictionary : return {
	"descriiption"  : "manipulates a Flag of triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "FLAG"
	,"inputs"       :  [  ["ADD","REMOVE","SWAP"] , _Flags.getFlags() ]
}


