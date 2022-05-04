extends Node
class_name _API_017_Cmd_AddAllKitParts


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "add all kitparts into inventory"  ,
			"parameter" : []                                 ,
			"list"      : []                                 ,
			"group"     : "kits"                             ,
			"input"     : "all kitparts"                     }



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	for kitpart in API_001_Atlas.KitParts().getEntries().values():
		API_003_Player.currentChar.kitventory().kitparts().append(kitpart)



