extends Node





func loadItems(itemsToLoad:Array):
	for entry in get_node("VBoxContainer").get_children(): entry.queue_free()
	
	
	for item in itemsToLoad:
		var currentRow = get_node("VBoxContainer")
		var sceneToLoad = load("res://GameSrc/Universal/GUI/gear_inventroy/ItemRow.tscn").instance()
		currentRow.add_child(sceneToLoad)
		
		var compsToLoad = getCompsToShowByClass(item)
		sceneToLoad.get_node("Name/RichTextLabel").bbcode_text = item.getCompValue(compsToLoad[0])
		sceneToLoad.get_node("Summary/RichTextLabel").bbcode_text = item.getCompValue(compsToLoad[1])
		sceneToLoad.get_node("Time/RichTextLabel").bbcode_text = item.getCompValue(compsToLoad[2])
		sceneToLoad.index = item.index()


func getCompsToShowByClass(ent):
	if ent is KitPartEntity:   
		return ["C_6_NAME","C_35_KIT_MECHANICAL_SUMMARY","C_36_KIT_MOD_TIME"]
		
	# STUB CONSUMABLES
