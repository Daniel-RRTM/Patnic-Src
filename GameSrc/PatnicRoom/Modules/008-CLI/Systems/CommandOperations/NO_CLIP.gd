extends Node
class_name _API_017_Cmd_NoClip


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "walking through inwalkables"  ,
			"parameter" : []                             ,
			"list"      : []                             ,
			"passive"   : true                           ,
			"group"     : "common"                       ,
			"input"     : "no clip"                      }



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	if API_003_Player.currentChar.hasFlag("F_CHEAT_1_NO_CLIP") :   API_003_Player.currentChar.flags.erase("F_CHEAT_1_NO_CLIP")
	else                                                       :   API_003_Player.currentChar.addFlag("F_CHEAT_1_NO_CLIP")


