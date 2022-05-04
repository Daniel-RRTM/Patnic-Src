extends Entity
# DOCS  > Docs\API\docs\Cogsmos\democrECS\Tile.md                              
# DOCS  > TO ADD                                                               
# BOOKMARK[epic=Entities] Tile                                                 
class_name TileEntity


# ----- INITIALICE --------------------------------------------------------- ##


var position : 	Vector2
 


# ----- PROXY FUNCTIONS ---------------------------------------------------- ##

#>>> General <<<#


func description()      -> String:     return getCompValue("C_0_DESCRIPTION")
func isWalkable()       -> bool: 	   return getCompValue("C_1_IS_WALKABLE")
func index()            -> String:     return getCompValue("C_12_ATLAS_INDEX")
	
	
	
#>>> ToString <<<#
	
	
func name()         -> String:     return getCompValue("C_6_NAME")
func typeToString()     -> String:     return ENUM.SOKRATILES.TYPES_ON_MAP.TILE
func type()             -> String:     return ENUM.SOKRATILES.TYPES_ON_MAP.TILE
func mouseHover_quack() -> String:     return index()



#>>> Spacial <<<#


func pos()              -> Vector2:    return position
func posX()             -> int:		   return int(position.x)
func posY()             -> int:		   return int(position.y)



#>>> Tilemap parse <<<#


func layer()            -> String:     return getCompValue("C_3_LAYER")
func staticTilesetNR()  -> int: 	   return getCompValue("C_7_STATIC_TILESET_NR")
func matrixNoise()      -> int:		   return getCompValue("C_5_MATRIX_NOISE")
func magicNoise()       -> int:		   return getCompValue("C_4_MAGIC_NOISE")



# ----- SETTER --------------------------------------------------------------- ##


func setPos(pos:Vector2): 	position = pos


	
