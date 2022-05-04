extends SokraTiles_Chunk_Actors
class_name SokraTiles_Chunk_NPC


# ----- INITIALICE ----------------------------------------------------------- ##


func _ready() -> void: .initialice(ENUM.SOKRATILES.LAYER.ACTOR,self)

 

# ----- GETTER --------------------------------------------------------------- ##


# VAR third Parameter [debugPara: true]  can be performance heavy 
func getEntByPos_quack(mainPos:Vector2,debugPara=false) -> ActorEntity:
	var validVec = stopAtDefaultTilemapSize(mainPos)
	if entsOnMap.has(validVec) : return entsOnMap[validVec]
	else:return null



# ----- SETTER --------------------------------------------------------------- ##

func drawCell_quack(index:String, mainPos:Vector2) -> void:   _drawCell( index,mainPos )



# ----- RENDER --------------------------------------------------------------- ##


