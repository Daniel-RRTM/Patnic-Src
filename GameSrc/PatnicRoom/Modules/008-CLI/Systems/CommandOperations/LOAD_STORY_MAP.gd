extends Node
class_name _API_017_Cmd_LoadStoryMap


# ----- DOC ------------------------------------------------------------------ ##


static func getAutoDoc() -> Dictionary:
	return{	"toString"  : "load story map"                     ,
			"parameter" : ["name"]                             ,
			"list"      : [AresProcGenes.staticMaps["STORY"]]  ,
			"group"     : "spawn"                              ,
			"input"     : "story map"                          }



# ----- OPERTATION ----------------------------------------------------------- ##


static func run(parameter:Array) -> void:
	var path = AresProcGenes.staticMaps["STORY"][parameter[0]]
	if path == null : return
	AresProcGenes.loadStaticMap(path)


