extends Node
class_name _TextToolBox_BrowserManager
 

var rootNode    

var filterAtlas       = _TextToolBox_Lists_Filter.getBrowserFilter()
var currentFormFilter = {}
var filterPair        = {}

var COLOR = {
	"default"  : Color("#7aa7ff"),
	"valid"   : Color("#6eed47"),
	"invalid"  : Color("#e6c58a"),
}



func _init(rootPara) -> void: rootNode = rootPara



# ----- MAIN ----------------------------------------------------------------- ##


func checkBrowseMode():
	var saniticedInput = getEntryOfName( rootNode.lastInput )
	var entries = rootNode.browserSelection
	
	if entries.has(rootNode.lastInput) : rootNode.readerManager.printGenerallEntity(entries[rootNode.lastInput])
	else                               : filterEntities()







func filterEntities() -> void :
	#>>> FILL SIDE TED <<<#
	match rootNode.CURRENT_FILTER:
		rootNode.ENUMS.FILTERS.RESET         :  _TextToolBox_Browser_Filter.reset(currentFormFilter, rootNode.sideTed)
		rootNode.ENUMS.FILTERS.DEFAULT       :  _TextToolBox_Browser_Filter.getDefault(currentFormFilter, rootNode.sideTed)
		rootNode.ENUMS.FILTERS.CURRENT_FORM  :  _TextToolBox_Browser_Filter.getType(currentFormFilter, rootNode.sideTed)
		rootNode.ENUMS.FILTERS.VALUE         :  _TextToolBox_Browser_Filter.getValue(filterPair, rootNode.sideTed)
	
	
	#>>> RESET MAIN TED <<<#
	var filterResult = {   "invalid":[] , "valid":[] , "default":[]   }
	for entry in rootNode.browserSelection.keys() : filterResult.default.append(entry)
	rootNode.mainTed.clear_colors()
	rootNode.mainTed.clearAllText()
	rootNode.mainTed.insertBackToMenue()
	
	
	#>>> APPLY FILTER <<<#
	for type in rootNode.sideTed.filterEntries.keys():
		for validation in rootNode.sideTed.filterEntries[type]:
			for entryKey in rootNode.browserSelection.keys():
				var entryValue = rootNode.browserSelection[entryKey].getCompValue(_TextToolBox_Lists_Filter.getCompOfFilter()[type])
				
				if validation == str(entryValue) : filterResult.valid.append(entryKey)
				else                             : filterResult.invalid.append(entryKey)
	
	
	#>>> PRINT FILTER <<<#
	for color in ["default","invalid","valid"]:
		for entry in filterResult[color]:
			var saniticedString = getNameOfEntry(entry)
			if color == "default" : rootNode.mainTed.insertTextNewLine(saniticedString)
			rootNode.mainTed.add_keyword_color(saniticedString,COLOR[color])



# ----- HELPERS -------------------------------------------------------------- ##


func getNameOfEntry(string): return string.replace("-","_").replace(" ","_")
func getEntryOfName(string): return string.replace(" ","").replace("_"," ")

func isEntrySelected(toSanitice:String,entries:Dictionary)  -> bool : return entries.has(toSanitice)



func prepareBrowsing(formToLoad):
	rootNode.browserManager.currentFormFilter = rootNode.browserManager.filterAtlas[formToLoad]
	rootNode.browserSelection = _TextToolBox_InstanceLoader.loadLECsToBrowse(rootNode.CURRENT_FORM)
	rootNode.CURRENT_FILTER = rootNode.ENUMS.FILTERS.RESET





