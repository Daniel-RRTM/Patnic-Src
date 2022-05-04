extends Node
class_name _004_Util




static func saniticeForHub(toSanitice:Array) -> Array:
	for filler in SYNTAX.EVENT.FILLER.keys(): toSanitice.erase(filler)
	
	for connector in SYNTAX.EVENT.CONNECTORS.keys(): 
		for count in toSanitice.count(connector):toSanitice.erase(connector)
	
	var cachedFiller = SYNTAX.EVENT.SYNONYMS
	for base in cachedFiller.keys():
		for synonym in cachedFiller[base]:
			var index =  toSanitice.find(synonym)
			if index != -1 : toSanitice[index] = base
	
	return toSanitice


static func convertArrayIntoHashmaps(toSanitice:Array,concept:String) -> Array:
	var dictToFill = { "upper" : toSanitice.pop_front() }
	var conceptClass = SYNTAX.EVENT.CONCEPTS[concept][dictToFill.upper].getAutoDoc()
	
	for paraNr in conceptClass.parameter.size():
		dictToFill[conceptClass.parameter.keys()[paraNr]] = toSanitice[paraNr]
	
	return dictToFill









static func getHighlightTextureOfEvent(medium:String) -> String :
	match medium:
		"LINEA_AREA" : return "Marker_5_1"
		"SELECT"     : return "-1"
		"LINEA"      : return "Marker_5_0"
		"AREA"       : return "Marker_5_0"
		"SELF"       : return "Marker_5_0"
	return ""



static func getAlertTextureOfEvent(medium:String) -> String :
	match medium:
		"LINEA_AREA" : return "Marker_5_1"
		"SELECT"     : return "Marker_5_2"
		"LINEA"      : return "Marker_5_1"
		"AREA"       : return "Marker_5_2"
		"SELF"       : return "Marker_5_1"
	return ""


static func getEventsNeedingDirection() -> Array: return [ "LINEA" ]


