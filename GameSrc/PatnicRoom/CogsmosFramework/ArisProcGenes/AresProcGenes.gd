extends Node
# CLASS                                                                        
# CLASS                                                                        
# CLASS                                                                        








var actorsOnMap = SokraTiles.getAllActorsOnMap()

var staticMaps = {
	"STORY" : SokraTiles.allCuratedMaps,
	"UNIQUE"  : {
		"EXPERIMENTAL":ENUM.FILE_PATHS.EXPERIMENTAL_TILEMAP,
		"TUTORIAL":"res://GameData/Tiled/TileMaps/Unique/Tutorial.json"
	}
}

func loadStaticMap(mapPath:String):
	_Arisprocgenes_StaticMaps.run(mapPath)
