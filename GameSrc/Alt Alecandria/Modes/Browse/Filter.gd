extends Node
class_name _Alecandria_Browse_Filter


static func getFIlterCompCrossRef() -> Dictionary: return {
	 "CREATOR"  : "C_71_LEC_META_BY"
	,"CATEGORY" : "C_31_KIT_CAT_TYPE"
	,"M_TYPE"   : "C_37_M_TYPE"
}

static func getFilter(type:String) -> Dictionary:
	var toReturn = _getCommon()
	
	if   ["Base","Mod","Appendix"].has(type) : toReturn = _expandKits(toReturn)
	elif type == "Role"                      : toReturn = _expandRoles(toReturn)
	
	return toReturn



static func _getCommon() -> Dictionary : return {
	"CREATOR"      : ["INHOUSE"],
	"M_TYPE"       : ENUM.SOKRATILES.M_TYPE.keys(),
	#"FIRST LETTER" : ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
}


static func _expandKits(toExpand:Dictionary) -> Dictionary:
	toExpand["CATEGORY"] = ENUM.KITS.CATEGORY.keys()
	return toExpand


static func _expandRoles(toExpand:Dictionary) -> Dictionary:
	toExpand["TIER"] = ["1","2","3","4","5"]
	return toExpand




