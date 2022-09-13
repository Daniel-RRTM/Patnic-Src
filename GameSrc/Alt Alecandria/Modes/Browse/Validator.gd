extends Node
class_name _Alecandria_Browse_Validator



static func validateList(rootNode) -> Dictionary:
	var COLOR        = {   "invalid":Color("#c0002d") , "valid":Color("#00bf03") , "default":Color("#868686")   }
	var filterResult = {   "invalid":[]               , "valid":[]               , "default":[]                 }
	var crossRef     = _Alecandria_Browse_Filter.getFIlterCompCrossRef()
	
	for entry in rootNode.BrowserManager.browsableEnts.keys() : filterResult.default.append(entry)
	rootNode.mainTed.clearAllText()
	rootNode.mainTed.insertTextNewLine("\n\n<<< BACK TO MENUE <<<\n\n\n")
	
	
	#>>> APPLY FILTER <<<#
	for type in rootNode.BrowserManager.currentFilter.keys():
		if rootNode.BrowserManager.currentFilter[type].size()>0:
			for validation in rootNode.BrowserManager.currentFilter[type]:
				
				for entryKey in rootNode.BrowserManager.browsableEnts.keys():
					var ent = rootNode.BrowserManager.browsableEnts[entryKey]
					var value = ent.getCompValue(crossRef[type])
					
					if validation == str(value) : filterResult.valid.append(entryKey)
					else                             : filterResult.invalid.append(entryKey)
		
	
	#>>> PRINT FILTER <<<#
	for color in ["default","invalid","valid"]:
		for entry in filterResult[color]:
			var saniticedString = entry.replace("-","")
			if color == "default" : rootNode.mainTed.insertTextNewLine(saniticedString)
			for word in saniticedString.split(" "):rootNode.mainTed.add_keyword_color(word,COLOR[color])
	
	return filterResult


