extends DemokrECTS_Atlas
class_name _001_Interactables


# ----- INITIALICE ----------------------------------------------------------- ##


func _init() -> void : classOfEntries = InteractEntity
	

func _ready():
	var tilesets = API_001_Atlas.TileSetAtlas().values()
	
	for currentTileset in tilesets:
		for currentTile in currentTileset:
			
			if currentTile.hasFlag(int(1)):  addEntity(currentTile)



# ----- SETTER --------------------------------------------------------------- ##
	
	
	
	









