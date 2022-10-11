extends Node


var LECDistribuution = {
	"TOTAL_LEC" : 0
}

func _ready()-> void:
	HomErrorLog.printIntoSeshLog("INIT","Alecandria parses external LEC into Entities...")
	_Alecandria_LecToEnt.parse()
	API_001_Atlas.sortKitpartsAtlas()
	HomErrorLog.printIntoSeshLog("INIT","Alecandria done!")
	





func getEntToLec(ent)         -> String     : return Alecandria_Parser_EntToLec_Hub.parseEntToString(ent)
func getKeywordHighlighting() -> Dictionary : return _Alecandria_Keywords.getDefault()
func getContextualKeywords()  -> Dictionary : return _Alecandria_Keywords.getDynamic()



