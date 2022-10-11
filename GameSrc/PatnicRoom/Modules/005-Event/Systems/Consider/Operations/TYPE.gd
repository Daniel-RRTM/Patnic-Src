extends _004_ConsiderParent
class_name _004_Consider_Type

# CLASS    THIS --->  TYPE  --->  IS TILE                                       X
# CLASS    THIS --->  TYPE  --->  NOT ACTOR                                     X
# CLASS    THIS --->  TYPE  --->  IS INTERACT                                   X

# ----- PROCESS -------------------------------------------------------------- ##


static func run(para:Dictionary, toConsider:Array) -> Array :
	var toReturn = []
	for ent in toConsider :   
		var searchedType 
		
		match para.typeName:
			"TILE"     :   searchedType = TileEntity
			"INTERACT" :   searchedType = InteractEntity
			"ACTOR"    :   searchedType = ActorEntity

			
		
		if   para.operand == "IS"  and  ent is searchedType: 
			toReturn.append(ent)
		elif para.operand == "NOT" and !ent is searchedType : 
			toReturn.append(ent)
		elif ent is PlayerEntity and API_004_KitSet.selection.medium == "SELF":
			toReturn.append(ent)
	
	return toReturn



# ----- DOC ------------------------------------------------------------------ ##


static func getValueToString_quack() -> String :   return "has [color=lime]Flag [/color][color=orange]" 


static func convertArrayToDict(parameters:Array) -> Dictionary : return {	
		 "typeName" : parameters[1]
		,"operand"  : parameters[0]
	}


static func getAutoDoc() -> Dictionary : return {
	"description"  : "returns valid entities with or without searched Type/Class"
	,"concept"      : "CONSIDER"
	,"name"         : "TYPE"
	,"inputs"       :  [  
		[ ["NOT","IS"] , ["ACTOR","TILE","INTERACT"] ]
	]
}


