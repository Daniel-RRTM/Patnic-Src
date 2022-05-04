extends TileMap
class_name SokraTiles_Chunk_Basic

var entsOnMap = {}





func _drawCell(id:String, mainPos:Vector2) -> void :  
	set_cell(mainPos.x, mainPos.y, tile_set.find_tile_by_name(id))



func stopAtDefaultTilemapSize(pos:Vector2):
	if pos.x > 99: pos.x = 99;   if pos.x < 0: pos.x = 0
	if pos.y > 99: pos.y = 99;   if pos.y < 0: pos.y = 0
	return pos



func drawWholeLayer_quack() -> void:
	clear()
	
	var toItterate = []
	if entsOnMap.values().front() is Entity: toItterate = entsOnMap.values()
	else: for ent in entsOnMap.values() : toItterate.append(instance_from_id(ent))
	
	for currentEnt in toItterate:
		var cacheID  = tile_set.find_tile_by_name(currentEnt.components["C_12_ATLAS_INDEX"].value)
		set_cell(currentEnt.position.x, currentEnt.position.y, cacheID)
		



