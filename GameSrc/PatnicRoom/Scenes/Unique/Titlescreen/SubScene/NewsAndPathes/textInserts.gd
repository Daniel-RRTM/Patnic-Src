extends Node2D


onready var inputPrompt = "QuickStart"
onready var optionBox   = get_node("Content")


func _ready() -> void:
	for currentName in Utils.directory().getDirNamesInFilepath("res://Config/SaveState"): 
		optionBox.add_item(currentName)
		if currentName == inputPrompt : optionBox.select(optionBox.get_item_count()-1)

func _on_Button_pressed() -> void:
	var toLoad = optionBox.get_item_text(optionBox.selected)
	API_003_Player.loadCharBySaveStateName(toLoad)
	Gameloop.startPanicMode()




func _on_Content_item_selected(index):
	var saveState = Utils.json().fileToDictionary("res://Config/savestate/"+optionBox.get_item_text(optionBox.selected)+"/common.json")
	get_node("stats/0/value").bbcode_text = "[color=yellow]0"
	get_node("stats/1/value").bbcode_text = "[color=yellow]1"
	get_node("stats/2/value").bbcode_text = "[color=yellow]"+str(saveState.kitventory.size())
	get_node("stats/3/value").bbcode_text = "[color=yellow]"+str(saveState.credits)
	



