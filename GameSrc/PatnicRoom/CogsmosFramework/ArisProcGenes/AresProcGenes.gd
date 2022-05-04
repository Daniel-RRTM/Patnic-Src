extends Node
# CLASS                                                                        
# CLASS                                                                        
# CLASS                                                                        








var actorsOnMap = SokraTiles.getAllActorsOnMap()

var staticMaps = {
	"STORY" : {
		"Suburban_One" : "res://GameData/Tiled/TileMaps/Story/Suburban_One.json",
		"Arcology"     : "res://GameData/Tiled/TileMaps/Story/Arcology.json",
		"Barrens"      : "res://GameData/Tiled/TileMaps/Story/Barrens.json",
		"Mall"         : "res://GameData/Tiled/TileMaps/Story/Mall.json"
	},
	"UNIQUE"  : {
		"EXPERIMENTAL":"res://GameData/Tiled/TileMaps/Unique/Experimental.json",
		"TUTORIAL":"res://GameData/Tiled/TileMaps/Unique/Tutorial.json"
	}
}

func loadStaticMap(mapPath:String):
	_Arisprocgenes_StaticMaps.run(mapPath)
