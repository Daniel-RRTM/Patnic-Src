extends OptionButton

var selectableOptions = ["","PERFORMANCE_ENHANCING_DRUGS","PRE_CRASH_DATA","REAGENTS"]

func _ready() -> void:  for item in selectableOptions: add_item(item)


func _on_mType_item_selected(index: int) -> void:
	var optionToSelect = selectableOptions[index]
	var cachedEntries = get_parent().get_parent().listOfEntries
	
	for entry in cachedEntries:
		if optionToSelect == "": entry.scene.visible=true
		elif entry.mType != optionToSelect: entry.scene.visible=false
	

func getAttribute()      -> String : return "type"
func getSelectionText()  -> String : return get_item_text(selected)
