extends OptionButton



var selectableOptions = ["","BASE","MOD","APPENDIX"]
onready var kitPartBrowserRoot = get_node("../../..")

func _ready() -> void:  for item in selectableOptions: add_item(item)


func _on_part_item_selected(index: int) -> void:
	var optionToSelect = selectableOptions[index]
	var cachedEntries = get_parent().get_parent().listOfEntries
	
	for entry in cachedEntries:
		if optionToSelect == "": entry.scene.visible=true
		elif entry.part != optionToSelect: entry.scene.visible=false
