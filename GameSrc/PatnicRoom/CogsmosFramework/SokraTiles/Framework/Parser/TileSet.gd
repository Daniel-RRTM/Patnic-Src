extends Object
# BOOKMARK[epic=Cogsmos] SokraTiles --- TileSet                                
class_name TilesetParser


static func run() -> void:
	for tilesetPath in Utils.directory().getFileNamesInFilepath(ENUM.FILE_PATHS.TILE_SETS):
		var tilesetMetaData = Utils.json().fileToDictionary(ENUM.FILE_PATHS.TILE_SETS+"/"+tilesetPath)
		var currentTileset  = []
		
		for tile in tilesetMetaData.tiles: 
			currentTileset.append(getTileEnt(tile))
		
		API_001_Atlas.addTileSet(tilesetMetaData.name, currentTileset) 



static func getTileEnt(tile:Dictionary, cachedTile={}):
	for comp in tile.properties: cachedTile[comp.name] = comp.value
	cachedTile["C_7_STATIC_TILESET_NR"] = tile.id
	return DemocrECS.initialiceNewEntry(cachedTile)




