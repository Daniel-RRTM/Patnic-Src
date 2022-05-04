extends Node
class_name _TextToolBox_BrowserManager


var rootNode    

var filterAtlas       = _TextToolBox_Lists_Filter.getBrowserFilter()
var currentFormFilter = {}
var filterPair        = {}

var COLOR = {
	"DEFAULT"  : Color("#7aa7ff"),
	"VALID"   : Color("#6eed47"),
	"INVALID"  : Color("#e6c58a"),
}



func _init(rootPara) -> void: rootNode = rootPara



# ----- MAIN ----------------------------------------------------------------- ##


func checkBrowseMode():
	var saniticedInput = getEntryOfName( rootNode.lastInput )
	var entries = rootNode.browserSelection
	
	if isEntrySelected(rootNode.lastInput,entries): showEntityOfBrowse(entries[rootNode.lastInput])
	else: filterEntities()




func showEntityOfBrowse(entity):
	rootNode.mainTed.setDefaultKeywords()
	rootNode.mainTed.text = "\n<<< BACK TO MENUE <<<\n>>> SHOW RAW DATA >>>\n\n"
	
	if rootNode.CURRENT_FORM == rootNode.ENUMS.FORMS.EVENT: rootNode.mainTed.text += Alecandria.getEntToLec(entity.event())
	
	else:
		var lecToString = Alecandria.getEntToLec(entity)
		var prettyPrint = _BrowserManager_PrettyPrint.getPrettyPrint(entity)
		rootNode.mainTed.text += prettyPrint
	
	
	rootNode.mainTed.add_font_override("font",load("res://Assets/Alecandria/customeFont/default.tres"))


func filterEntities() -> void :
	match rootNode.CURRENT_FILTER:
		rootNode.ENUMS.FILTERS.RESET         :  _TextToolBox_Browser_Filter.reset(currentFormFilter, rootNode.sideTed)
		rootNode.ENUMS.FILTERS.DEFAULT       :  _TextToolBox_Browser_Filter.getDefault(currentFormFilter, rootNode.sideTed)
		rootNode.ENUMS.FILTERS.CURRENT_FORM  :  _TextToolBox_Browser_Filter.getType(currentFormFilter, rootNode.sideTed)
		rootNode.ENUMS.FILTERS.VALUE         :  _TextToolBox_Browser_Filter.getValue(filterPair, rootNode.sideTed)
	printList()



# ----- SUBPROCESS ----------------------------------------------------------- ##


func printList() -> void :
	rootNode.mainTed.clear_colors()
	rootNode.mainTed.clearAllText()
	rootNode.mainTed.insertBackToMenue()
	
	var listToShow = getEntriesToLoad()
	
	for color in ["DEFAULT","INVALID","VALID"]:
		for entry in listToShow[color]:
			
			var saniticedString = getNameOfEntry(entry)
			if color == "DEFAULT" : rootNode.mainTed.insertTextNewLine(saniticedString)
			rootNode.mainTed.add_keyword_color(saniticedString,COLOR[color])



# ----- HELPERS -------------------------------------------------------------- ##


func getNameOfEntry(string): return string.replace("-","_").replace(" ","_")
func getEntryOfName(string): return string.replace(" ","").replace("_"," ")

func isEntrySelected(toSanitice:String,entries:Dictionary)  -> bool : return entries.has(toSanitice)



func prepareBrowsing(formToLoad):
	rootNode.browserManager.currentFormFilter = rootNode.browserManager.filterAtlas[formToLoad]
	rootNode.browserSelection         = _TextToolBox_InstanceLoader.loadLECsToBrowse(rootNode.CURRENT_FORM)
	rootNode.CURRENT_FILTER           = rootNode.ENUMS.FILTERS.RESET


func getEntriesToLoad():
	var toReturn = {"INVALID":[] , "VALID":[], "DEFAULT":[]   }
	
	for entry in rootNode.browserSelection.keys() : toReturn["DEFAULT"].append(entry)
	
	for type in rootNode.sideTed.filterEntries.keys():
		var compToFilter  = _TextToolBox_Lists_Filter.getCompOfFilter()[type]
		var allToValidate = rootNode.sideTed.filterEntries[type]
		
		for singleValidation in allToValidate:
			for i in rootNode.browserSelection.size():
				var entryName = rootNode.browserSelection.keys()[i]
				var compValue = rootNode.browserSelection[entryName].getCompValue(compToFilter)
				
				if str(type) == "CREATOR":
					if singleValidation.to_lower() in str(compValue) : toReturn["VALID"].append(entryName)
				
				if str(type) == "KIT_PART":
					if singleValidation == ENUM.KITS.PARTS.keys()[compValue] : toReturn["VALID"].append(entryName)
				
				if singleValidation == str(compValue) : toReturn["VALID"].append(entryName)
				else : toReturn["INVALID"].append(entryName)

	return toReturn






