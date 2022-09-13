extends _004_ConsiderParent
class_name _004_Consider_Template

# CLASS    THIS --->  COMP  --->  C_65_TIER EQUALLS 1                           X
# CLASS    THIS --->  COMP  --->  C_48_RARITY NOT 10                            X
# CLASS    THIS --->  COMP  --->  C_57_HITPOINTS MORE THAN BISECT               X

# ----- PROCESS -------------------------------------------------------------- ##

# REFACTOR 
static func run(para:Dictionary, toConsider:Array) -> Array :
	var toReturn = []
	for ent in toConsider:

		if para.operand == "IS": 
			if ent.hasTemplate(para.tempName): 
				if ent.getCompTempValue(para.tempName,"C_12_ATLAS_INDEX") == para.toCheck: toReturn.append(ent)
		if para.operand == "NOT": 
			if ent.hasTemplate(para.tempName): 
				if ent.getCompTempValue(para.tempName,"C_12_ATLAS_INDEX") != para.toCheck: toReturn.append(ent)
	
	return toReturn




# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String :   return "has [color=lime]Condition [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : return {	
	 "tempName" : parameters[0]
	,"toCheck" : parameters[2]
	,"operand"  : parameters[1]
}


static func getAutoDoc() -> Dictionary : return {
	"description" : "returns valid entities with or without searched Template"
   ,"concept"      : "CONSIDER"
   ,"name"         : "TEMP"
   ,"inputs"       :  [ 
		["RACE","ROLE","SPECIALTY"], ["IS","NOT"] , "index" 
	]
}

