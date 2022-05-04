extends SokraTiles_Chunk_Actors
class_name SokraTiles_Chunk_Player


# ----- INITIALICE --------------------------------------------------------------- ##


func _ready() -> void:readyProxy()
func readyProxy() -> void:
	SokraTiles.addLayerManager(ENUM.SOKRATILES.LAYER.PLAYER,self)
	entsOnMap[API_003_Player.currentChar.pos()] = API_003_Player.currentChar
	
	updateCammera()
	get_tree().get_root().get_node("Node2D").recievePlayer(self)

 

# ----- MOVE --------------------------------------------------------------------- ##


func movePlayer(directionEnum) -> void:
	moveActor(directionEnum,API_003_Player.currentChar)
	API_002_Tilemap.interpreteTile(API_003_Player.currentChar, self )
	updateCammera()


func updateCammera() -> void:   get_node("Camera2D").updateCenter( API_003_Player.currentChar.pos() )
