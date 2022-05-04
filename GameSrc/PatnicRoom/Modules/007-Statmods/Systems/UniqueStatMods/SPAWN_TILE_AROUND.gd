extends Object
class_name _007_005_SPAWN_TILE_AROUND


# ----- MAIN --------------------------------------------------------------------- ##


static func run(ent,toPerform:Array):
	var para = saniticeParameter(toPerform)
		
	var entTemp = API_001_Atlas.Tiles().getEntry(para.entToSpawn)
	if !is_instance_valid(ent): ent = instance_from_id(ent)
	var tilemapNode = SokraTiles.getLayerNode(entTemp.layer())
	
	API_004_KitSet.selection.selects = []
	API_004_KitSet.selection.reach = para.reach
	API_004_KitSet.selection.source = ent.pos()
	
	for pos in _004_Seize_MediumArea.run():
			var cache = DemocrECS.copyEntity(entTemp)
			cache.setPos(pos)
			var oldEnt = tilemapNode.getEntByPos_quack(pos)
			SokraTiles.swapInEntity(oldEnt,cache)



# ----- META --------------------------------------------------------------------- ##


func getName_quack()          -> String :  return "SPAWN_TILE_AROUND"
func getValueToString_quack() -> String :  return ""


static func getDoc():
	return {
		
		"toShort"          : "spawn Tile around",
		"keyword"          : "U_SPAWN_TILE_AROUND",
		"name"             : "Spawns Tile around",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "Spawn Tile around by index",

		"inputModule"      : "TEXTURE"

	}


static func saniticeParameter(parameters:Array) -> Dictionary : 
	return { 	"entToSpawn" : parameters[1]      ,
				"reach"      : int(parameters[2]) }




