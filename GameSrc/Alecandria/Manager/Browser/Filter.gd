extends Node
class_name _TextToolBox_Browser_Filter






static func reset(allDefaultTypes:Dictionary, ted:LECTextEditor):
	ted.rootNode.CURRENT_FILTER = ted.rootNode.ENUMS.FILTERS.DEFAULT
	ted.get_parent().visible = true
	ted.grab_focus()
	
	for entry in allDefaultTypes.keys():
		ted.filterEntries[entry] = []
	
	ted.printOwnFilter()




static func getDefault(allDefaultTypes:Dictionary, ted:LECTextEditor):
	ted.rootNode.CURRENT_FILTER = ted.rootNode.ENUMS.FILTERS.CURRENT_FORM
	
	var type      = ted.getKeyOfOption()
	if !type.empty():
		var allOfType = allDefaultTypes[type]
		
		ted.clearAllText()
		ted.insertNewLine()
		for value in allOfType: ted.printTerm(type,value)
		ted.insertNewLine()
		ted.insertTextNewLine(">>> RESET <<<")



static func getType(dict:Dictionary, ted:LECTextEditor):
	ted.rootNode.CURRENT_FILTER = ted.rootNode.ENUMS.FILTERS.DEFAULT
	
	var relevantType = ted.getInputAsCompDict()["KEY"]
	var toAdd        = ted.getInputAsCompDict()["VALUE"]
	
	if ted.canBeAdded(relevantType,toAdd) : ted.filterEntries[relevantType].append(toAdd) 
	ted.printOwnFilter()





static func getValue(dict:Dictionary, ted:LECTextEditor):
	pass




