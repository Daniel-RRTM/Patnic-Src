extends Node
class_name _API_017_Cmd_Restmode


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "enters the P@nicroom of the chunk" ,
			"parameter" : []                                  ,
			"list"      : []                                  ,
			"group"     : "common"                            ,
			"input"     : "restmode"                          }



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	Gameloop.startRestMode()


