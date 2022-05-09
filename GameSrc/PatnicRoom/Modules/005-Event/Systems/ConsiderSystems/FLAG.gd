extends _004_ConsiderParent
class_name _004_Consider_Flag

# CLASS    THIS --->  FLAG  --->  NOT F_CHEAT_1_NO_CLIP                         X
# CLASS    THIS --->  FLAG  --->  HAS F_1_INTERACTABLE_TYPE                     X
# CLASS    THIS --->  FLAG  --->  HAS F_8_IS_WALL                               X

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary, toConsider:Array) -> Array :
	var toReturn = []
	for ent in toConsider :
		
		if   para.operand == "HAS"  and  ent.hasFlag(para.flagName)  :  toReturn.append(ent)
		elif para.operand == "NOT"  and !ent.hasFlag(para.flagName)  :  toReturn.append(ent)
	
	return toReturn



# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : return {	
		 "flagName" : parameters[1]
		,"operand"  : parameters[0]
	}


static func getAutoDoc() -> Dictionary : return {
	 "descriiption" : "returns selections with the Flag!"
	,"concept"      : "CONSIDER"
	,"name"         : "FLAG"
	,"inputs"       :  [ ["HAS","NOT"] , "Flag" ]
}


