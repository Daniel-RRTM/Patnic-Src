extends DemokrECTS_Atlas
class_name _001_Tiles


# ----- INITIALICE ----------------------------------------------------------- ##


var atlas_Tilesets = {}

func _init() -> void : classOfEntries = TileEntity



# ----- GETTER --------------------------------------------------------------- ##


func getTileSetEntries() -> Dictionary : 
	return atlas_Tilesets

func getTilesOfSet(tileSetName:String) -> Dictionary: return atlas_Tilesets[tileSetName]

 

# ----- SETTER --------------------------------------------------------------- ##


func createTileset(tilesetName:String,tiles:Array):
	atlas_Tilesets[tilesetName] = tiles
	
	for tile in tiles:   
		if tile is TileEntity or tile is InteractEntity:
			if !atlasEntry.has(tile):
				
				atlasEntry[tile.index()] = tile
				entryComponentRef[tile.index()] = tile.components.keys()
			
			else: printerr("Error in Atlas_TileEntity! ["+str(tile.name())+"] already exists")
		else: printerr("Error in Atlas_TileEntity! ["+(tile.name())+"] could not be added")





