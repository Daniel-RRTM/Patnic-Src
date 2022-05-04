extends RichTextLabel

var currentCmd       = "" 
var currentParameter   = -1
var currentState     = CMD_STATE.CMD

enum CMD_STATE { EMPTY, CMD, PARA, VALID }
var neededParameter  = -1
var monitorFormat = "[color=lime][center]"

var allParameterNode = []
var cmdsToString  = []
var cmdsSyntax    = {}

var cmdInput
var cmdParameterNode  = []


func _ready() -> void:   
	bbcode_text      = ""
	cmdInput         = get_node("../../../InputMonitor/cmd/Control")
	cmdParameterNode = [ getParameterNode(0), getParameterNode(1), getParameterNode(2), getParameterNode(3) ]
	
	
	for category in API_008_CLI.getGroupedSyntax().values():
		for cmd in category.values():
			
			var key         = cmd["input"]
			cmdsSyntax[key] = cmd
			cmdsToString.append(key)


func getParameterNode(nr): return get_node("../../../InputMonitor/Control/"+str(nr))



func _input(event: InputEvent) -> void:
	if event.is_pressed() and not event.is_echo() and event is InputEventKey:
		
		
		if event.is_action("Interface_Generall_Enter") : enterInput()
		elif event.as_text() == "Space"                : bbcode_text += " "
		elif event.as_text() == "BackSpace"            : bbcode_text = ""
		
		else                                           : bbcode_text += event.as_text().to_lower()	



func enterInput():
	if currentState == CMD_STATE.CMD:		prepareParameter()
	if currentState == CMD_STATE.VALID:		processCmd()
	if currentState == CMD_STATE.PARA:		insertParameter()
	bbcode_text = ""



func prepareParameter():
	if cmdsToString.has(bbcode_text):
		
		cmdInput.bbcode_text = monitorFormat+bbcode_text
		currentCmd           = bbcode_text
		currentState         = CMD_STATE.PARA
		currentParameter     = 0
		
		
		var dictOfCmd = cmdsSyntax[currentCmd]
		var parameter = dictOfCmd["parameter"]
		
		for i in parameter.size():   
			var currentPanel = cmdParameterNode[i]
			var currentText  = currentPanel.get_node("paraText")
			allParameterNode.append(currentText)
			
			currentPanel.visible    = true
			currentText.bbcode_text = "[center]"+parameter[i]
		
		neededParameter = allParameterNode.size()
	
	if neededParameter == 0:  currentState = CMD_STATE.VALID
	
	bbcode_text = ""



func insertParameter():
	allParameterNode[currentParameter].bbcode_text = bbcode_text
	currentParameter += 1
	if neededParameter == currentParameter: currentState = CMD_STATE.VALID



func processCmd():
	var cacheParameter = []
	var cacheCmd       = cmdInput.bbcode_text.split(monitorFormat)
	
	for i in range(0,neededParameter):
		var currentParameter = allParameterNode[i]
		cacheParameter.append(currentParameter.bbcode_text)
	
	
	API_008_CLI.processCmd(cacheCmd[1],cacheParameter)
	bbcode_text = "[color=lime][center]SUCCES"



