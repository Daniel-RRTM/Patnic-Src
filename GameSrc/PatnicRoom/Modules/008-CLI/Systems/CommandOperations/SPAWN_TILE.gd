extends Node
class_name _API_017_Cmd_SpawnTile


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "spawn tile above"                   ,
			"parameter" : ["index"]                            ,
			"list"      : [API_001_Atlas.Tiles().getEntries()] ,
			"group"     : "spawn"                              ,
			"input"     : "spawn tile"                         }



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	var cache = API_003_Player.currentChar.pos()
	var saniticedPos = Vector2(cache.x,cache.y+1)
	
	var tileNameOfParameter = parameter[0]
	
	var newEnt = API_001_Atlas.Tiles().getEntry(tileNameOfParameter)
	newEnt.setPos(saniticedPos)
	SokraTiles.getLayerNode(newEnt.layer()).addEntOnMap_quack(newEnt)
	Signals.emit_signal("Tilemap_Changed")


