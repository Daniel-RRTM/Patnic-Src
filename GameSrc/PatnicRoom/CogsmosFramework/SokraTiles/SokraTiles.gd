
extends Node
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               
# BOOKMARK[epic=Cogsmos] SokraTiles --- Main                                   


# ----- INITIALICE --------------------------------------------------------- ##



var tilemap       = {}
var tilemapNode   = {}
var actors_on_map = {}


func _ready() -> void : TilesetParser.run()



# ----- TILEMAP ------------------------------------------------------------ ##


func parseTilemap(tileMapFilePath:String) -> void :
	self.tilemap = SokraTiles_TilemapParser.parseTileMap(tileMapFilePath)
	Signals.emit_signal("Tilemap_Changed")

func addLayerManager(layerEnum,chunkClass) -> void :
	tilemapNode[layerEnum] = chunkClass



func swapInEntity(oldEnt,newEnt):
	newEnt.position = oldEnt.position
	removeEntOnTilemap(oldEnt)
	addEntOnTilemap(newEnt)

func removeEntOnTilemap(ent):
	var tilemapNode = SokraTiles.getLayerNode(ent.layer())
	tilemapNode.drawCell_quack("-1",ent.pos())
	tilemapNode.removeEntOnMap_quack(ent)

func addEntOnTilemap(ent):
	var tilemapNode = SokraTiles.getLayerNode(ent.layer())
	tilemapNode.drawCell_quack(ent.index(),ent.pos())
	tilemapNode.addEntOnMap_quack(ent)



# ----- GETTER --------------------------------------------------------------- ##


#>>> General <<<#


func getLayerNode(key)               -> SokraTiles_Chunk_Basic :   return tilemapNode[ENUM.SOKRATILES.LAYER[key]] if key is String else tilemapNode[key]
func getAllActorsOnMap()             -> Array                  :   return actors_on_map.values()
func getLayerDictionary(key:int)     -> Dictionary             :   return tilemap[key]



#>>> By Layer <<<#


func getPlayer()         -> SokraTiles_Chunk_Player               :	  return tilemapNode[ENUM.SOKRATILES.LAYER.PLAYER]
func getActor()          -> SokraTiles_Chunk_Actors               :	  return tilemapNode[ENUM.SOKRATILES.LAYER.ACTOR]

func getSelection()      -> Sokratiles_Chunk_Selection            :   return tilemapNode[ENUM.SOKRATILES.LAYER.SELECTION]
func getCondition()      -> Sokratiles_Chunk_Condition            :   return tilemapNode[ENUM.SOKRATILES.LAYER.CONDITION]

func getMeatInteract()   -> SokraTiles_Chunk_Meat_Interactables   :	  return tilemapNode[ENUM.SOKRATILES.LAYER.MEAT_INTERACTABLE]
func getMeatFloor()      -> SokraTiles_Chunk_Meat_Floor           :	  return tilemapNode[ENUM.SOKRATILES.LAYER.MEAT_GROUND]

func getMatrixInteract() -> SokraTiles_Chunk_Matrix_Interactables :	  return tilemapNode[ENUM.SOKRATILES.LAYER.MATRIX_INTERACTABLE]
func getMatrixFloor()    -> SokraTiles_Chunk_Matrix_Floor         :   return tilemapNode[ENUM.SOKRATILES.LAYER.MATRIX_GROUND]

func getMagicInteract()  -> SokraTiles_Chunk_Magic_Interactables  :   return tilemapNode[ENUM.SOKRATILES.LAYER.MAGIC_INTERACTABLE]
func getMagicFloor()     -> SokraTiles_Chunk_Magic_Floor          :   return tilemapNode[ENUM.SOKRATILES.LAYER.MAGIC_GROUND]


