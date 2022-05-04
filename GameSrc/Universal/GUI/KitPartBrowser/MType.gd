extends OptionButton

var selectableOptions = ["","MEAT","MATRIX","MAGIC"]
onready var kitPartBrowserRoot = get_node("../../..")

func _ready() -> void:  for item in selectableOptions: add_item(item)


func _on_mType_item_selected(index: int) -> void:
	var optionToSelect = selectableOptions[index]
	var cachedEntries = get_parent().get_parent().listOfEntries
	
	for entry in cachedEntries:
		if optionToSelect == "": entry.scene.visible=true
		elif entry.mType != optionToSelect: entry.scene.visible=false
	

