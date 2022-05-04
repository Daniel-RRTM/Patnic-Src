extends TextEdit
class_name LECTextEditor


onready var rootNode  = get_node("/root/Node2D")
var twinEditor        : LECTextEditor
var textForReset      = ""


func _init() -> void : setDefaultKeywords()


func closeEditor() -> void : twinEditor.grab_focus()

func openEditor(currentComp) -> void :
	get_parent().visible = true
	visible = true
	grab_focus()





#>>> TEXT INSERTS <<<#
func clearAllText()                -> void : text = ""

func insertTextNewLine(content="") -> void : text += content+"\n"

func insertNewLine(i=1)            -> void : for j in range(i): insertTextNewLine()
func insertBuffer()                -> void : for i in range(50-text.split("\n").size()) : text+= "\n"

func insertBackToMenue()           -> void : insertTextNewLine("\n<<< BACK TO MENUE <<<\n\n")
func insertCreateElement()         -> void : insertTextNewLine(">>> CREATE GAME ELEMENTE >>>")



#>>> TEXT FORMATTER <<<#
func getInput()           -> String     : return get_line(cursor_get_line())
func getInputAsCompDict() -> Dictionary : return getCompOfString(getInput())

func getCompOfString(string:String) -> Dictionary : 
	var saniticedString = string.replace(" ","")
	var arrOfValues     = saniticedString.split("--->") as Array
	return {    "KEY"   : arrOfValues.pop_front(), 
				"VALUE" : arrOfValues.pop_front()   }


#>>> VALIDATOR <<<#

func isInput(toCheck:String) -> bool :   return toCheck == getInput()
func isInputBlank()          -> bool : return text == ""





func setDefaultKeywords() -> void :
	add_color_region(">>>",">>>",Color("#07e02b"))
	add_color_region("<<<","<<<",Color("#ff9752"))
	add_keyword_color("CREATE GAME ELEMENTE",Color("#07e02b"))
	
	var syntaxHighlighting = Alecandria.getKeywordHighlighting()
	for keyword in syntaxHighlighting.keys() : add_keyword_color(keyword,syntaxHighlighting[keyword])
	for nr in range(10000) : add_keyword_color(str(nr),Alecandria.getContextualKeywords()["NUMBERS"])





