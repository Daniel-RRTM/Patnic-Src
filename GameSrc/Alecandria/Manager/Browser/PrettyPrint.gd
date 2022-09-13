extends Object
class_name _BrowserManager_PrettyPrint


static func getPrettyPrint(ent) -> String:
	var prettyString = "\n\n"
	
	prettyString += printMeta(ent.components)
	prettyString += "\n\n"
	
	prettyString += printMain(ent.components)
	prettyString += "\n\n"
	
	prettyString += printReference(ent.components)
	prettyString += "\n\n"	
	return prettyString



static func printMeta(components:Dictionary) -> String:
	var toReturn = "META \n"
	for metaComp in ["C_71_LEC_META_BY","C_72_LEC_META_USE","C_12_ATLAS_INDEX"]:
		toReturn += printPair(components[metaComp],20)
	return toReturn


static func printMain(components:Dictionary) -> String:
	var toReturn = "MAIN \n"
	for comp in components.values():
		
		if comp.name == "C_14_LEC_RAW_DATA":
			toReturn += "  Raw LEC             "
			toReturn += "->    >>> SHOW RAW DATA >>>\n"
		
		else:
		
			if !["C_71_LEC_META_BY","C_72_LEC_META_USE","C_12_ATLAS_INDEX"].has(comp.name):
				if comp.name == "C_49_EVENT_REFERENCE": 
					toReturn += "  "+comp.getAutoDoc()["nameToShow"]
					for i in 20-comp.getAutoDoc()["nameToShow"].length(): toReturn += " "
					toReturn += "->    >>> SHOW EVENT >>>\n"
				else:toReturn += printPair(comp,20)
	return toReturn



static func printReference(components:Dictionary) -> String:
	return "REFERENCES \n  "






static func printPair(comp,indent):
	var toReturn = "  "
	var name     = comp.getAutoDoc()["nameToShow"]
	
	toReturn += name
	for i in indent-name.length(): toReturn += " "
	toReturn += "->    " + str(comp.value)+"\n"
	
	return toReturn



