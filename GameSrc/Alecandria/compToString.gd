extends Control


onready var suggestVisible = get_node("Suggestion")
onready var desctVisible = get_node("Description")


onready var nameText     = get_node("titile")
onready var indexText    = get_node("comp index")
onready var suggestText  = get_node("Suggestion/text")
onready var descText     = get_node("Description/text")
onready var dataTypeText = get_node("dataType")



func showValue(currentComp):
	nameText.bbcode_text     =   currentComp.printTitle()
	indexText.bbcode_text    =   currentComp.printComp()
	descText.bbcode_text     =   currentComp.printDescription()
	suggestText.bbcode_text  =   currentComp.printSuggestion()
	dataTypeText.bbcode_text =   currentComp.printDataType()
	desctVisible.visible     =  !descText.bbcode_text.empty()
	suggestVisible.visible   =  !suggestText.bbcode_text.empty()



func hideValue() -> void :
	descText.bbcode_text        = ""
	suggestText.bbcode_text     = ""
	nameText.bbcode_text        = ""
	indexText.bbcode_text       = ""
	dataTypeText.bbcode_text    = ""
	suggestVisible.visible      = false
	desctVisible.visible        = false



