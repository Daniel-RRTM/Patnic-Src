extends Object
# BOOKMARK[epic=Cogsmos] SokraTiles --- TileSet                                
class_name TilesetParser

# REFACTOR 
const FILEPATH = "res://Gamedata/Tiled/TileSets/JSON"


# REVIEW                   

static func run() -> void:
	for tilesetPath in getListOfFilePathsOfDirectory(FILEPATH):
		var tilesetMetaData = Utils.json().fileToDictionary(tilesetPath)
		var currentTileset  = []
		
		for tile in tilesetMetaData.tiles: 
			currentTileset.append(getTileEnt(tile))
		
		API_001_Atlas.addTileSet(tilesetMetaData.name, currentTileset) 



static func getTileEnt(tile:Dictionary, cachedTile={}):
	for comp in tile.properties: cachedTile[comp.name] = comp.value
	cachedTile["C_7_STATIC_TILESET_NR"] = tile.id
	return DemocrECS.initialiceNewEntry(cachedTile)







static func getListOfFilePathsOfDirectory(path, filesArray=[]):
	var dir = Directory.new()                                   
	
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "" or file.empty()                              : break                                                             
		elif !file.begins_with(".") and !file.ends_with(".import") : filesArray.append(path+"/"+file)
			
	dir.list_dir_end()
	return filesArray


