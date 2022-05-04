extends Object
class_name _007_001_DEAL_PLAIN_DAMAGE


# ----- MAIN --------------------------------------------------------------------- ##


static func run(ent,performance:Array) -> void : 
	var para = saniticeParameter(performance)
	
	ent.getComp("C_57_HITPOINTS").value -= int(para.damageValue)
	
	if ent.getCompValue("C_57_HITPOINTS") <= 0:
	
		if ent is ActorEntity : 
			API_010_ProcGen_Actor.removeActorFromGame(ent)
	
		elif ent is InteractEntity:   
			var newEnt = DemocrECS.copyEntity(API_001_Atlas.Tiles().getEntry("Indoors_1_13"))
			newEnt.position = ent.position
			SokraTiles.swapInEntity(ent,newEnt)



# ----- META --------------------------------------------------------------------- ##


func getValueToString_quack() -> String :  return "deal X plain damage"
func getName_quack()          -> String :  return "DEAL_PLAIN_DAMAGE"

static func getDoc():
	return {
		
		"toShort"          : "deal bio Damage",
		"keyword"          : "U_DEAL_PLAIN_DAMAGE",
		"name"             : "Deal plain damage",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "Deal damage to actors",

		"inputModule"      : "SLIDER"

	}


static func saniticeParameter(parameters:Array) -> Dictionary : 
	return { "damageValue" : parameters[1] }





