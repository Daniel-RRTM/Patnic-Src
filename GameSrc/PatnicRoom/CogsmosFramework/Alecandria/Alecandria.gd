extends Node




func _ready()-> void:
	_Alecandria_LecToEnt.parse()
	API_001_Atlas.sortKitpartsAtlas()
	





func getEntToLec(ent)         -> String     : return Alecandria_Parser_EntToLec_Hub.parseEntToString(ent)
func getKeywordHighlighting() -> Dictionary : return _Alecandria_Keywords.getDefault()
func getContextualKeywords()  -> Dictionary : return _Alecandria_Keywords.getDynamic()



