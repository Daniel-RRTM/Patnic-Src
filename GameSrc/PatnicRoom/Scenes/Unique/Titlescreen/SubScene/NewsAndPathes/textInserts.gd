extends Node2D


onready var inputPrompt = "select savestate!"
onready var optionBox   = get_node("Content")


func _ready() -> void:
	optionBox.add_item(inputPrompt)
	for currentName in Utils.directory().getDirNamesInFilepath("res://Config/SaveState"): optionBox.add_item(currentName)


func _on_Button_pressed() -> void:
	var toLoad = optionBox.get_item_text(optionBox.selected)
	if !inputPrompt in toLoad: 
		API_003_Player.loadCharBySaveStateName(toLoad)
		Gameloop.startPanicMode()


