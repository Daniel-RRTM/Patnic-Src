extends Object
class_name _007_006_SPAWN_TILE


# ----- MAIN --------------------------------------------------------------------- ##


static func run(ent:Entity,performance:Array) -> void : 
	var newEnt = DemocrECS.copyEntity(API_001_Atlas.Tiles().getEntry(performance[0]))
	if is_instance_valid(ent):SokraTiles.swapInEntity(ent,newEnt)




# ----- META --------------------------------------------------------------------- ##


func getValueToString_quack() -> String :  return "change to alternate Texture"
func getName_quack()          -> String :  return "SPAWN_TILE"

 
static func getDoc():
	return {
		
		"toShort"          : "spawn Tile",
		"keyword"          : "U_SPAWN_TILE",
		"name"             : "Spawns Tile",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "Spawn Tile by index",

		"inputModule"      : "TEXTURE"
		,"parameter"       : ["TILE_INDEX"]
		,"list"       : [API_001_Atlas.Tiles().getEntries()]
		
	}


