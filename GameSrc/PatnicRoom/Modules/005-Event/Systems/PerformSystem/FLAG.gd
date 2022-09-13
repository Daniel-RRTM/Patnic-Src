extends _004_PerformParent
class_name _004_Perform_Flag

# CLASS    FLAG  --->  ADD   F_CHEAT_1_NO_CLIP                                   
# CLASS    FLAG  --->  SWAP  F_19_ACTOR_CAN_NOT_MOVE                             
# CLASS    FLAG  --->  REMOVE  F_8_IS_WALL                                       

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary,ent) -> void :
	match para.mode:
		"SWAP"   : if !ent.hasFlag(para.flag) :   ent.addFlag(para.flag);   else : ent.removeFlag(para.flag)  
		"ADD"    : if !ent.hasFlag(para.flag) :   ent.addFlag(para.flag)
		"REMOVE" : if  ent.hasFlag(para.flag) :   ent.removeFlag(para.flag)



# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : return {	
		 "flag" : parameters[2]
		,"mode" : parameters[3]
	}



func getAutoDoc() -> Dictionary : return {
	"description"  : "manipulates a Flag of triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "FLAG"
	,"inputs"       :  [
		[["ADD","REMOVE","SWAP"] , "FLAG_INDEX"]
	 ]
}


