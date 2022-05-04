extends Node
# BOOKMARK[epic=Modules] 002_Tilemap_Structure                                 
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICE ----------------------------------------------------------- ##


var cacheForSelection = {} 

var _out 


var _tileInterpreter



func _ready():
	_tileInterpreter = _002_TileInterpreter.new()
	_out             = _002_Out.new()
	



func getMovePos(posBase:Vector2,directionEnum):
	return _002_Utils.modPos(posBase,directionEnum,1)

func getMovePosByMultiple(posBase:Vector2,directionEnum,times):
	return _002_Utils.modPos(posBase,directionEnum,times)



# ----- GETTER --------------------------------------------------------------- ##


func interpreteTile(actor,node:Node): _tileInterpreter.interpreteTileNr(actor,node)









