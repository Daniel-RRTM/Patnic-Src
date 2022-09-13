extends Node
# BOOKMARK[epic=Cogsmos] SokraTiles --- TileMap                                
class_name SokraTiles_TilemapParser


# ----- OPEN FUNKTIONS ------------------------------------------------------- ##




static func parseByString(filepathToMap:String) -> Dictionary:
	var tiledImport = Utils.json().fileToDictionary(filepathToMap)
	var mapMetaData = cleanUpTiledImport(Utils.json().fileToDictionary(filepathToMap))
	var toReturn    = itterateLayers(mapMetaData)
	
	return toReturn






static func itterateLayers(mapMetaData:Dictionary) -> Dictionary:
	var toReturn = {}
	for mapLevel in mapMetaData.levels:
		var parsedMap = {}
		
		for layerInLevel in mapLevel.keys():
			var currentLayer = mapLevel[layerInLevel]
			
			if !currentLayer.empty():
				var formatedLayer       = _parseLayer(mapMetaData,currentLayer)
				parsedMap[ENUM.SOKRATILES.LAYER.get(layerInLevel)] = formatedLayer
				
				if layerInLevel == "PLAYER":  findPlayer(formatedLayer)
			
			toReturn = parsedMap
	return toReturn
 


# FUNC !	!                                             
# FUNC _parseLayer(true) for 0 at every Tile                     
# FUNC _parseLayer(false,layerVar) for inserting LayerVars Tile  
static func _parseLayer(mapMetaDataPara,layer):
	var size           = mapMetaDataPara["size"]
	var knownTileNrs   = mapMetaDataPara["tileNrs"]
	var toReturn       = {}
	
	for x in size.x:
		for y in size.y:
			var currentTileNr = layer[x*100+y]
			
			if currentTileNr != 0:
				var entTemp            = API_001_Atlas.Tiles().getEntry( knownTileNrs[int(currentTileNr)] )
				var entInstance        = DemocrECS.copyEntity(entTemp)
				entInstance.position   = Vector2(y,x)
				toReturn[Vector2(y,x)] = entInstance.get_instance_id()
	
	return toReturn




static func findPlayer(layer):
	for x in layer.values():
		if x is int:
			var playerPos = instance_from_id(x).position
			API_003_Player.currentChar.setPos(Vector2(playerPos.x,playerPos.y))







static func cleanUpTiledImport(tiledImport,mapMetaData={}):
	mapMetaData["levels"]   = getLayersOfLevel(tiledImport.layers)
	mapMetaData["size"]     = Vector2(tiledImport.height,tiledImport.width)
	mapMetaData["tileNrs"]  = getMapSpecificTileNr(tiledImport.tilesets)
	return mapMetaData


static func getLayersOfLevel(import,ordered=[]):
	for level in import: 
		var sublayers = {}
		
		for layerDict in level.layers: 
			if layerDict.type =="objectgroup": SokraTiles.spawnLayer = layerDict
			else:sublayers[layerDict.name] = layerDict.data
		
		ordered.append(sublayers)
	return ordered


static func getMapSpecificTileNr(tiledImport,usedTiles={}):
	var staticNrOffset   = []
	for i in tiledImport.size():staticNrOffset.append(i*256)
	
	for tiledOrderEntry in tiledImport:
		var offset = staticNrOffset.pop_front()
		for tile in API_001_Atlas.Tiles().getTileSetEntries()[tiledOrderEntry.source.replace(".json","").split("JSON/")[1]]:
			usedTiles[tile.staticTilesetNR()+offset+1] = tile.index()
	
	return usedTiles










