extends Viewport
class_name MouseMarker




static func getMouseMarker(ent):
	match ent.typeToString():
		ENUM.SOKRATILES.TYPES_ON_MAP.TILE        :  return _getActionType(ENUM.SOKRATILES.MOUSE_INPUT_MODE.ONLOOK, ent)
		ENUM.SOKRATILES.TYPES_ON_MAP.INTERACT    :  return _getActionType(ENUM.SOKRATILES.MOUSE_INPUT_MODE.ONLOOK, ent)
		ENUM.SOKRATILES.TYPES_ON_MAP.ACTOR       :  return _getActionType(ENUM.SOKRATILES.MOUSE_INPUT_MODE.ONLOOK, ent)
		ENUM.SOKRATILES.TYPES_ON_MAP.LOOT_SOURCE :  return _getActionType(ENUM.SOKRATILES.MOUSE_INPUT_MODE.LOOT,   ent)


static func _getActionType(mode,ent):
	match mode:	
		ENUM.SOKRATILES.MOUSE_INPUT_MODE.ONLOOK:   return _getOnlookMarker(ent)
		ENUM.SOKRATILES.MOUSE_INPUT_MODE.LOOT:     return _getLootMarker(ent)





static func _getOnlookMarker(ent):
	var entityType = ent.typeToString()

	match entityType:
		ENUM.SOKRATILES.TYPES_ON_MAP.TILE     : return "Marker_2_1"
		ENUM.SOKRATILES.TYPES_ON_MAP.INTERACT : return "Marker_2_0"
		ENUM.SOKRATILES.TYPES_ON_MAP.ACTOR    : return "Marker_2_2"
 
		

static func _getLootMarker(availabillity):
	match availabillity:
		"EMPTY"    : return "Marker_3_0"
		"OPEN"     : return "Marker_3_1"
		"CLOSED"   : return "Marker_3_2"
		