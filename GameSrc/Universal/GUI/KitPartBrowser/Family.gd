extends OptionButton


onready var allEntries = get_parent().get_parent().listOfEntries

var dictOfItems = {}

func _ready() -> void:	add_item("",0)

func _on_mType2_pressed() -> void:

	buildEntryAtlas()
	for entry in dictOfItems.values(): 
		if entry["visible"] and !items.has(entry["name"]):
			add_item(entry["name"])
	print(items.size())



func _on_Family_item_selected(index: int) -> void:
	if get_item_text(index) == "": reset()
	
	else:
		var kitName = get_item_text(index)
		var kitFamiliy
		
		for entry in dictOfItems.values():   
			if kitName == entry["name"] : 
				kitFamiliy = entry["family"]
		 
		for entry in allEntries: 
			if entry.kitset.family() != kitFamiliy: 
				entry.scene.visible = false



func buildEntryAtlas():
	for entry in get_parent().get_parent().listOfEntries:
		var value = {   "family"  : entry.kitset.family() ,
						"visible" : entry.scene.visible   ,
						"name"    : entry.kitset.name()   }
		dictOfItems[value["name"]] = value




func reset():
	dictOfItems.clear()
	buildEntryAtlas()
	
	for entry in allEntries:   entry.scene.visible = true
	
	items.clear()





