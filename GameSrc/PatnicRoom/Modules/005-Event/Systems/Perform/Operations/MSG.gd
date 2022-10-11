extends _004_PerformParent
class_name _004_Perform_Msg

# CLASS    FLAG  --->  ADD   F_CHEAT_1_NO_CLIP                                   
# CLASS    FLAG  --->  SWAP  F_19_ACTOR_CAN_NOT_MOVE                             
# CLASS    FLAG  --->  REMOVE  F_8_IS_WALL                                       

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary,ent) -> void :
	var toMsg : PoolStringArray
	toMsg.append(API_004_KitSet.selection.entity.toString+" found ")

	for info in para.toMessage:
		if info == "POSITION" : toMsg.append("  on X:"+str(ent.posX())+" / on Y:"+str(ent.posY()))
		else: toMsg.append(ent.getCompValue(info))
	API_014_NewsLog.kitEntry(toMsg.join(""))

	



# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String     :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : 
	parameters.erase("AND")	
	return {
		 "toMessage" : parameters 
	}



func getAutoDoc() -> Dictionary : return {
	"description"  : "manipulates a Flag of triggered selection"
	,"concept"      : "PERFORM"
	,"name"         : "FLAG"
	,"inputs"       :  [
		[["COMP_INDEX","POSITION"]]
	 ]
}


