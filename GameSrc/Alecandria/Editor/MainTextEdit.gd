extends LECTextEditor
class_name LECTextEditor_Main



func _ready() -> void : 
	twinEditor = rootNode.get_node("Editors/Input/Frame/TextEdit")
	name = "MAIN"



func printPair():
	clearAllText()
	self.insertBackToMenue()
	for comp in rootNode.compInput.values():   text += comp.printRow()
	self.insertNewLine(3)
	self.insertCreateElement()
	self.insertBuffer()
	textForReset = text
















