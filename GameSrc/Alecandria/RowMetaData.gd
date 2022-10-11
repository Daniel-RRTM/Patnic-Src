extends Node
class_name _TextToolBox_RowMetaData



var nameToShow
var compToString
var description
var validType

var suggestion = ""
var validInput = []
var value      = ""

var spacing    = ""



func _init(compDict:Dictionary, compToStringPara:String) -> void:
	nameToShow   = compDict["nameToShow"].replace("-","_")
	description  = compDict["description"]
	suggestion   = compDict["suggestion"]
	validInput   = compDict["validInputs"]
	validType    = compDict["validType"]

	compToString = compToStringPara
	value        = ""
	
	for i in range(20-nameToShow.length()): spacing += " "



func printRow()         -> String : 
	if value != null: return nameToShow + spacing + " --->   " + value
	else: return nameToShow + spacing + " --->   "


func printTitle()       -> String : return "[center]" + nameToShow
func printComp()        -> String : return "[center]" + compToString
func printDescription() -> String : return description
func printSuggestion()  -> String : return suggestion


func printDataType():
	match validType:
		"STRING"      : return "enter Words  "
		"INTEGER"     : return "emter Number"
		"BOOLEAN"     : return "select Statee "
		"STATIC_LIST" : return "select line   "
		_:return"enter Words  "


