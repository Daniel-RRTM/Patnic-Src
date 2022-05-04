extends Node2D
class_name TextToolBox



var CURRENT_INTRO  
var CURRENT_MODE
var CURRENT_FORM 
var CURRENT_SCENE
var CURRENT_FILTER

var focusedEditor    : LECTextEditor
onready var mainTed  = get_node("Editors/Main/Frame/MAIN")
onready var sideTed  = get_node("Editors/Input/Frame/SIDE")
onready var sideNote = get_node("Sidenote")


var ENUMS            : _TextToolBox_Enum
var pairManager      : _TextToolBox_PairManager
var menueManager     : _TextToolBox_MenueManager
var browserManager   : _TextToolBox_BrowserManager



var browserSelection = {}

var componentsDocs   = {}
var compInput        = {}
var lastInput


func _ready() -> void:
	ENUMS          = _TextToolBox_Enum.new(self)
	pairManager    = _TextToolBox_PairManager.new(self)
	menueManager   = _TextToolBox_MenueManager.new(self)
	browserManager = _TextToolBox_BrowserManager.new(self)
	
	mainTed.grab_focus()
	menueManager.loadMainMenue()
	
	var compAtlas = DemocrECS.getAllComponents()
	for key in compAtlas.keys() : componentsDocs[key] = compAtlas[key].getAutoDoc()





func _input(event: InputEvent) -> void :

	#>>> set cursor collumn <<<#
	if !isCurrent(ENUMS.MODES.WRITE_PAIR) : sideTed.cursor_set_column(0)
	mainTed.cursor_set_column(0)
	
	
	#>>> get focused editor <<<#
	for editor in [mainTed,sideTed]: if editor.has_focus(): focusedEditor = editor
	
	
	if event.is_action("ui_tab") and get_node("Editors/Input/Frame").visible:
		if mainTed.has_focus(): focusedEditor=sideTed
		else:focusedEditor = mainTed
	
		
	#>>> manage input <<#
	if event.is_action("Interface_Generall_Enter"):
		lastInput = focusedEditor.getInput()
		if !focusedEditor.getInput().empty():
			
			menueManager.checkMenueMode()
			
			if   isCurrent(ENUMS.MODES.WRITE_PAIR): pairManager.checkPairMode()
			elif isCurrent(ENUMS.MODES.READ) and !isCurrent(ENUMS.FORMS.VOID): browserManager.checkBrowseMode()
	






func isCurrent(enumPara:int) -> bool :
	var cache = [CURRENT_INTRO,CURRENT_SCENE,CURRENT_FORM,CURRENT_MODE,CURRENT_FILTER]
	var divident = cache[enumPara / 10]
	return divident == enumPara



func getRowDataOfInput():
	for comp in compInput.values():
		if comp.nameToShow == focusedEditor.getInputAsCompDict()["KEY"]: 
			return comp




