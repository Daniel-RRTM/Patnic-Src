extends Entity
# DOCS  > Docs\API\docs\Cogsmos\democrECS\Actor.md                             
# DOCS  > TO ADD                                                               
# BOOKMARK[epic=Entities] Actor                                                
class_name ActorEntity

 
# ----- INITIALICE --------------------------------------------------------- ##


var position: Vector2



# ----- PROXY FUNCTIONS ---------------------------------------------------- ##

#>>> General <<<#


func index()        -> String:	return getCompValue("C_12_ATLAS_INDEX")
func name()         -> String:	return getCompTempValue("ROLE","C_6_NAME")
func staticTilesetlNr() -> String:	return getCompValue("C_7_STATIC_TILESET_NR")
func mouseHover_quack() -> String:  return synonym()
func synonym()          -> String:return Utils.rng().getRandomFromArray(getCompValue("C_47_SYNONYM"))



#>>> ToString <<<#


func type()             -> String:  return ENUM.SOKRATILES.TYPES_ON_MAP.ACTOR
func typeToString()     -> String:  return ENUM.SOKRATILES.TYPES_ON_MAP.ACTOR


	
#>>> Spacial <<<#


func position()         -> Vector2:	return position
func pos()				-> Vector2: return position()
func posX()             -> int:     return int(position.x)
func posY()             -> int:     return int(position.y)
func layer()            -> int:     return ENUM.SOKRATILES.LAYER.ACTOR



#>>> Attributes <<<#


func constitution()     -> int:		return getCompValue("C_19_ATTRIBUTES").constitution.value
func agillity()         -> int:		return getCompValue("C_19_ATTRIBUTES").agillity.value
func reaction()         -> int:		return getCompValue("C_19_ATTRIBUTES").reaction.value
func willpower()        -> int:		return getCompValue("C_19_ATTRIBUTES").willpower.value
	
func strength()         -> int:		return getCompValue("C_19_ATTRIBUTES").strength.value
func intuition()        -> int:		return getCompValue("C_19_ATTRIBUTES").intuition.value
func charisma()         -> int:		return getCompValue("C_19_ATTRIBUTES").charisma.value
func logic()            -> int:		return getCompValue("C_19_ATTRIBUTES").logic.value



#>>> Indirect Stats <<<#


func carriageCapacity() -> int:		return getCompValue("C_26_INDIRECT_STATS").carriageCapacity
func physicalLimit()    -> int:		return getCompValue("C_22_LIMITS").physicalLimit
func socialLimit()      -> int:		return getCompValue("C_22_LIMITS").socialLimit
func mentalLimit()      -> int:		return getCompValue("C_22_LIMITS").mentalLimit
func hitpoints()        -> int:		return getComp("C_57_HITPOINTS").value
func condition()        -> int:		return getCompValue("C_26_INDIRECT_STATS").condition


func maxKitsets()       -> int:     return getCompValue("C_25_MAX_KITSETS")



# ----- SETTER ------------------------------------------------------------- ##


func setPos(pos:Vector2) -> void:   position = pos



