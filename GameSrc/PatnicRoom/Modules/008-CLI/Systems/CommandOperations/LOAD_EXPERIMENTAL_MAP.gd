extends Node
class_name _API_017_Cmd_LoadUniqueMap


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "load unique map"                    ,
			"parameter" : ["name"]                             ,
			"list"      : [AresProcGenes.staticMaps["UNIQUE"].keys()] ,
			"group"     : "spawn"                              ,
			"input"     : "unique map"                         }



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	var path = AresProcGenes.staticMaps["UNIQUE"][parameter[0]]
	AresProcGenes.loadStaticMap(path)


