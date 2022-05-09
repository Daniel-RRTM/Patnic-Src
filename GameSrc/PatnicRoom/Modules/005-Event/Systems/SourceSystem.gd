extends Object
class_name _004_Seize_Source


# REFACTOR[epic=LEC-SYNTAX] Changing into Enums for Dynamic expansion          

static func getByHub() -> Array :
	var sources = []
	var selection = API_004_KitSet.selection

	match selection.event.getSource():
		"SELF"     :   sources = [SYNTAX.EVENT.CONCEPT.SEIZE.SOURCE.SELF.run()]


		_:printerr("at EVENT_PARSE, SOURCE :"+API_004_KitSet.selection.event.getSource()+" NOT FOUND")


	return sources




static func getAutoDoc() -> Dictionary:
	return{
		"description" : "defines from where the Shape will be formed, this is a list and can contain multiple positions ",
		"mandatory"   : "Only has \"SELF\" at the moment",
		"Parameter"   : EVENT_SYNTAX.SOURCE()
	}
