extends Node
class_name _TextToolBox_ReaderManager

var rootNode
var strBackToMenue   = "<<< BACK TO MENUE <<<"
var strShowRawData   = ">>> SHOW RAW DATA >>>"
var strShoweventData = ">>> SHOW EVENT >>>"

var entityToRead

func _init(rootPara) -> void: rootNode = rootPara



func checkReaderMode():
	rootNode.mainTed.setDefaultKeywords()
	rootNode.mainTed.text = "\n"+strBackToMenue+"\n\n\n"
		
	if rootNode.lastInput.split("->    ")[1] == strShowRawData:
		rootNode.mainTed.text += Alecandria.getEntToLec(entityToRead)
	
	if rootNode.lastInput.split("->    ")[1] == strShoweventData:
		rootNode.mainTed.text += printEventEntity()



func printGenerallEntity(entity):
	entityToRead = entity
	rootNode.CURRENT_MODE = rootNode.ENUMS.MODES.READ
	rootNode.mainTed.setDefaultKeywords()
	rootNode.mainTed.text = "\n"+strBackToMenue+"\n\n\n"
	
	#var lecToString = Alecandria.getEntToLec(entity)
	var prettyPrint = _BrowserManager_PrettyPrint.getPrettyPrint(entity)
	rootNode.mainTed.text += prettyPrint
	
	rootNode.mainTed.add_font_override("font",load("res://Assets/Alecandria/customeFont/default.tres"))



func printEventEntity():
	var toStr = ""
	toStr += "  INDEX    --->  "+entityToRead.getCompValue("C_12_ATLAS_INDEX")+"\n"
	toStr += "  USE      --->  "+entityToRead.getCompValue("C_72_LEC_META_USE")+"\n"
	toStr += "  BY       --->  "+entityToRead.getCompValue("C_71_LEC_META_BY")+"\n\n\n\n"
	
	var event = entityToRead.event()
	
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










