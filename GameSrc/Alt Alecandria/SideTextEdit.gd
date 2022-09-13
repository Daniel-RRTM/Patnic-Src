extends LECTextEditor
class_name LECTextEditor_Side


onready var sideNote = get_node("/root/Node2D/Sidenote") 
var compToValue 
var filterEntries = {}



func _ready() -> void : 
	twinEditor = rootNode.get_node("Editors/Main/Frame/TextEdit")
	name = "SIDE"




func closeInput():
	get_parent().visible = false
	compToValue          = null


func prepareInput(selectedComp):
	compToValue = selectedComp
	get_parent().visible = true
	grab_focus()
	
	text = "\n"
	for line in getToPrint():
		text += line+"\n"
	
	if getToPrint().size() == 1 and rootNode.isCurrent(rootNode.ENUMS.MODES.READ): cursor_set_line(4)





func printOwnFilter():
	clearAllText()
	insertNewLine()
	for key in filterEntries :  printTerm(key,filterEntries[key])
	insertNewLine()
	insertTextNewLine(">>> RESET <<<")




func printTerm(leftTerm:String,rightTerm):
	text += leftTerm
	for i in range(10-leftTerm.length()): text += " "
	
	text += "--->  "
	
	if rightTerm != null : 
		if rightTerm is String :   text += rightTerm
		if rightTerm is Array  :   text += PoolStringArray(rightTerm).join(" AND ") 
	text += "\n"




func getKeyOfOption()   -> String : return getInput().split("--->")[0].replace(" ","")

func canBeAdded(type:String,object:String) -> bool: return !filterEntries[type].has(object)









func getToPrint():
	match compToValue.validType:
		"STRING"       :  return ["Write word(s)   vvv"]
		"INTEGER"      :  return ["Write number(s) vvv"]
		"BOOLEAN"      :  return ["TRUE","FALSE"]
		"STATIC_LIST"  :  return compToValue.validInput
		"VECTOR2D"     :  return ["Write x,y       vvv"]
		_:return ["Write here vvvv"]



