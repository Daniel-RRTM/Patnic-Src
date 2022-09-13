extends Node
class_name _Alecandria_Read_Manager


var fontPath   = "res://Assets/Alecandria/customeFont/default.tres"
var keywords   = "Selection"
var strBackToMenue   = "<<< BACK TO MENUE <<<"
var staticText = "\n"+strBackToMenue+"\n\n\n"

var currentEntToRead

var strShowRawData   = ">>> SHOW RAW DATA >>>"
var strShoweventData = ">>> SHOW EVENT >>>"


func manageInput(event:InputEvent, root) -> void:
	if event.is_action("Interface_Generall_Enter"):
		var mainInput = root.mainTed.getInput()
		var inputTerms = mainInput.split("->    ")
		
		if  mainInput == strBackToMenue: root.changeMode(root.MenueManager)
		
		if inputTerms.size()>1:
			root.mainTed.text = staticText
			if inputTerms[1] == strShowRawData: root.mainTed.text += Alecandria.getEntToLec(currentEntToRead)
			if inputTerms[1] == strShoweventData: root.mainTed.text += printEventEntity()
		
	


func runCustomPrep(root) -> void:
	var string = _Alecandria_Reader_PrettyPrint.getPrettyPrint(currentEntToRead)
	root.mainTed.insertTextNewLine(string)




func printEventEntity():
	var toStr = ""
	toStr += "  INDEX    --->  "+currentEntToRead.getCompValue("C_12_ATLAS_INDEX")+"\n"
	toStr += "  USE      --->  "+currentEntToRead.getCompValue("C_72_LEC_META_USE")+"\n"
	toStr += "  BY       --->  "+currentEntToRead.getCompValue("C_71_LEC_META_BY")+"\n\n\n\n"
	
	var event = currentEntToRead.event()
	
	toStr += "  SEIZE:\n"
	toStr += "    MEDIUM  ->  "+event["SELECT"]["SEIZE"]["MEDIUM"]+"\n"
	toStr += "    SOURCE  ->  "+event["SELECT"]["SEIZE"]["SOURCE"]+"\n"
	toStr += "    REACH   ->  "+event["SELECT"]["SEIZE"]["REACH"]+"\n"
	
	toStr += "\n\n  CONSIDER:\n"
	for consideration in event["SELECT"]["CONSIDER"]:
		toStr += "    "+consideration.connector+" "+consideration.operation+"  ->  "
		for parameter in consideration.parameter.values():
			toStr += " "+str(parameter)
		toStr += "\n"
	
	toStr += "\n\n  PERFORM:\n"
	for consideration in event["RUN"]["PERFORM"]:
		toStr += "    "+consideration.operation+"  ->  "
		
		if consideration.operation == "UNIQ":
			toStr += consideration.parameter.type+": "
			for parameter in consideration.parameter.parameter:toStr += " "+str(parameter)
		
		else:
			for parameter in consideration.parameter.values():toStr += " "+str(parameter)
		
		toStr += "\n"
	
	
	return toStr
