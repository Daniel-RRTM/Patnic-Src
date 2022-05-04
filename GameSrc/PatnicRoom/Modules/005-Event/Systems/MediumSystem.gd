extends Object
class_name _004_Seize_Medium


# REFACTOR[epic=LEC-SYNTAX] Changing into Enums for Dynamic expansion          

static func getByHub() -> Array :
	var positions = []
	
	match API_004_KitSet.selection.medium:
		"AREA"       :   positions = _004_Seize_MediumArea.run()
		"LINEA"      :   positions = _004_Seize_MediumLinea.run()
		"SELECT"     :   positions = _004_Seize_MediumSelect.run()
		"SELF"       :   positions = _004_Seize_MediumSelf.run()
		
		_:printerr("ERROR!! at EVENT_PARSE, MEDIUM : "+API_004_KitSet.selection.medium+" NOT FOUND")
	
	return positions
	
	

static func getAutoDoc() -> Dictionary:
	return{
		"description" : "defines in which shape the Selection will take ",
		"mandatory"   : "Needs at least \"MEDIUM ---> SELF\" ",
		"Parameter"   : EVENT_SYNTAX.MEDIUM()
	}









