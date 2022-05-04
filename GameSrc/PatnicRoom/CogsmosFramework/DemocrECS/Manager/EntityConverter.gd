extends Object
class_name _DemocrECTS_EntityConverter


# ----- INITIALICE ------------------------------------------------------------- ##                                                 


var metaData = {
	 "TILE"      : {   "class" : TileEntity        ,   "mandatoryComps" : ENUM.MINIMAL_COMP.TILE           ,   "flag" : "F_2_TILE_TYPE"                    }
	,"INTERACT"  : {   "class" : InteractEntity    ,   "mandatoryComps" : ENUM.MINIMAL_COMP.INTERACT       ,   "flag" : "F_1_INTERACTABLE_TYPE"            }
	
	,"KP_BASE"   : {   "class" : KitPartEntity     ,   "mandatoryComps" : ENUM.MINIMAL_COMP.KITPART_BASE   ,   "flag" : "F_15_KITPART_TYPE_BASE"           }
	,"KITPART"   : {   "class" : KitPartEntity     ,   "mandatoryComps" : ENUM.MINIMAL_COMP.KITPART_MOD    ,   "flag" : "F_16_KITPART_TYPE_MOD"            }
	
	,"ROLE"      : {   "class" : Entity            ,   "mandatoryComps" : ENUM.MINIMAL_COMP.ROLE           ,   "flag" : "F_10_ACTOR_ATTRIBUTES_ROLES"      }
	,"SPECIALTY" : {   "class" : Entity            ,   "mandatoryComps" : ENUM.MINIMAL_COMP.SPECIALTY      ,   "flag" : "F_7_ACTOR_ATTRIBUTES_SPECIALTY"   }
	,"RACE"      : {   "class" : Entity            ,   "mandatoryComps" : ENUM.MINIMAL_COMP.RACE           ,   "flag" : "F_11_ACTOR_ATTRIBUTES_RACE"       }
	,"CONDITION" : {   "class" : ConditionEntity   ,   "mandatoryComps" : ENUM.MINIMAL_COMP.CONDITION      ,   "flag" : "F_11_ACTOR_ATTRIBUTES_RACE"       }
	
	,"LEC_EVENT" : {   "class" : "EventEntity"     ,   "mandatoryComps" : ENUM.MINIMAL_COMP.RACE           ,   "flag" : "F_11_ACTOR_ATTRIBUTES_RACE"       }
	}



# ----- CONSTRUCTION ----------------------------------------------------------- ## 


func createEntityByDict(toParse:Dictionary) -> Entity:
	var metaData = getEntityType(toParse)
	var ent      = DemocrECTS_EntityManager.constructNewEntity(metaData,toParse)
	_addEntityToAtlas(ent as Entity, metaData["flag"])
	return ent as Entity


func copyEntity(toParse:Entity) -> Entity:
	var metaData = getEntityType(toParse)
	var ent      = DemocrECTS_EntityManager.convertEntity(metaData,toParse)
	return ent as Entity



# ----- HELPERS ---------------------------------------------------------------- ##


func getEntityType(toParse) -> Dictionary:
	for entry in metaData.values(): 
		if toParse is Entity     :  if toParse.hasFlag( entry["flag"] ) :  return entry
		if toParse is Dictionary :  if toParse.has(     entry["flag"] ) :  return entry
		
	DemocrECS.failed_parsers[toParse] = toParse
	return {}



func _addEntityToAtlas(ent:Entity,keyword):
	match keyword:
		"F_2_TILE_TYPE"                  : API_001_Atlas.Tiles().addEntity(ent)
		"F_1_INTERACTABLE_TYPE"          : API_001_Atlas.Interactables().addEntity(ent)
		
		"F_15_KITPART_TYPE_BASE"         : API_001_Atlas.KitParts().addEntity(ent)
		"F_16_KITPART_TYPE_MOD"          : API_001_Atlas.KitParts().addEntity(ent)
		
		"F_10_ACTOR_ATTRIBUTES_ROLES"    : API_001_Atlas.Role().addEntity(ent)
		"F_7_ACTOR_ATTRIBUTES_SPECIALTY" : API_001_Atlas.Specialty().addEntity(ent)
		"F_11_ACTOR_ATTRIBUTES_RACE"     : API_001_Atlas.Race().addEntity(ent)
		




