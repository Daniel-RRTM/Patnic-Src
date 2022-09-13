extends Object
class_name _007_004_MOVE_SELECT


# ----- MAIN --------------------------------------------------------------------- ##


static func run(ent,toPerform:Array): 
	if toPerform.has("REACH"):
		var currentPos = ent.pos() 
		var finalPos
		
		for nextTile in API_004_KitSet.selection.selectedPos:
			if nextTile is ActorEntity or nextTile.hasComp("C_1_IS_WALKABLE"): 
				finalPos = nextTile.pos()
			else: return
	
		SokraTiles.getActor().moveaActor(finalPos,ent)
		API_006_Condition.attachConditionToEnt(ent,"INCAPACITATED",2)



# ----- META --------------------------------------------------------------------- ##


func getValueToString_quack() -> String :  return "change to alternate Texture"
func getName_quack()          -> String :  return "MOVE_SELECT"


static func getDoc():
	return {
		
		"toShort"          : "move user",
		"keyword"          : "U_MOVE_USER",
		"name"             : "Move User",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "WIP",

		"inputModule"      : "VOID"
		,"parameter"       : [["1","2","...","99"]]
		,"list"       : ["number"]

	}
