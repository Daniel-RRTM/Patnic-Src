extends Node
class_name _Alecandria_Root


enum MODE {   MAIN , SELECT , BROWSE , WRITE , READ   }

onready var mainTed   = get_node("Editors/Main/Frame/MAIN")
onready var sideTed   = get_node("Editors/Input/Frame/SIDE")
onready var sideNote  = get_node("Sidenote")
onready var compAtlas = DemocrECS.getAllComponents()

onready var BrowserManager = _Alecandria_Browse_Manager.new()
onready var DesignManager = _Alecandria_Designer_Manager.new()
onready var MenueManager = _Alecandria_Menue_Manager.new()
onready var ReadManager = _Alecandria_Read_Manager.new()

var currentMode

func _ready() -> void:
	currentMode = MenueManager
	initialiceMode()
	mainTed.grab_focus()



func initialiceMode() -> void:
	var allKeywords = Utils.json().fileToDictionary("res://GameData/Alecandria/TextInserts/Keywords.json")[currentMode.keywords]
	for word in allKeywords.keys():  mainTed.add_keyword_color(word,allKeywords[word])
	mainTed.add_font_override("font",load(currentMode.fontPath))
	mainTed.text = currentMode.staticText
	currentMode.runCustomPrep(self)



func _input(event:InputEvent) -> void:
	if currentMode != DesignManager : mainTed.cursor_set_column(0)
	
	if event is InputEventKey:
		currentMode.manageInput(event,self)
		#elif sideTed.has_focus() : currentMode.manageSidePanel(event,self)



func changeMode(manager) -> void:
	currentMode = manager
	initialiceMode()

