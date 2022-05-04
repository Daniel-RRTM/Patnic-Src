extends OptionButton

var selectableOptions = ["","GUN","MEELE","ARMOR","HACK","CYBERWARE","DRONE","SPELL","INFUSION","RITES"]
onready var kitPartBrowserRoot = get_node("../../..")

func _ready() -> void: for item in selectableOptions: add_item(item)


func _on_category_item_selected(index: int) -> void:
	var optionToSelect = selectableOptions[index]
	var cachedEntries = get_parent().get_parent().listOfEntries
	
	for entry in cachedEntries:
		if optionToSelect == "": entry.scene.visible=true
		elif entry.category != optionToSelect: entry.scene.visible=false

