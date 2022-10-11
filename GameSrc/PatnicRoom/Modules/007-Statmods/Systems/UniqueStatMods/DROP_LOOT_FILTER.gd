extends Object
class_name _007_007_DROP_LOOT_FILTER


# ----- MAIN --------------------------------------------------------------------- ##

# STUB       
static func run(ent,toPerform:Array):
	var para = saniticeParameter(toPerform)
	var lootFilter = API_001_Atlas.LootFilter().getEntry(para.filterIndex).getCompValue("C_61_LOOT_TABLE")
	lootFilter = Utils.rng().getRandomFromArray(lootFilter["DECLARATION"].values())
	
	
	API_011_ProcGen_Loot.generateLoot()
	



# ----- META --------------------------------------------------------------------- ##


func getName_quack()          -> String :  return "DROP_LOOT_FILTER"
func getValueToString_quack() -> String :  return ""


static func getDoc():
	return {
		"toShort"          : "spawns loot",
		"keyword"          : "DROP_LOOT_FILTER",
		"name"             : "droop loot-filter",
		
		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",
		
		"toString"         : "spawns loot of an Index",

		"inputModule"      : "TEXTURE"
		,"parameter"       : ["LOOT_FILTER_INDEX"]
		,"list"       : [API_001_Atlas.LootFilter().getEntries()]

	}


static func saniticeParameter(parameters:Array) -> Dictionary : 
	return { 	"filterIndex" : parameters[0] }




