extends Control


var listOfKitSets = []

func _ready():
	var cache = API_003_Player.currentChar.kitventory().kitsets().cacheKitset
	reset()
	hideNotReachedKitSetSlots(cache.maxKits)
	fillEntry(cache.listOfKits)




func reset():
	for row in get_node("VBoxContainer").get_children():
		for collumn in row.get_children():
			if collumn is Panel: collumn.get_node("RichTextLabel").clear()



func hideNotReachedKitSetSlots(maxKitsets): 
	for i in range(maxKitsets,10):  get_node("VBoxContainer"+str(i)).visible = false



func fillEntry(cache):
	for i in cache.size():
		var rowNode = get_node("VBoxContainer/"+str(i))
		var kitset  = cache.values()[i]
		
		rowNode.get_node("Mtype/RichTextLabel").bbcode_enabled = true
		rowNode.get_node("category/RichTextLabel").bbcode_enabled = true
		rowNode.get_node("Family/RichTextLabel").bbcode_enabled = true
		
		
		rowNode.get_node("Mtype/RichTextLabel").bbcode_text    = "[center]"+kitset.base.mType()
		rowNode.get_node("category/RichTextLabel").bbcode_text = "[center]"+kitset.base.catType()
		rowNode.get_node("base/RichTextLabel").bbcode_text     = kitset.base.name()
		rowNode.get_node("Family/RichTextLabel").bbcode_text   = "[center]"+kitset.base.family()
		
		if is_instance_valid(kitset.mod)      : rowNode.get_node("mod/RichTextLabel").bbcode_text       = kitset.mod.name()
		if is_instance_valid(kitset.appendix) : rowNode.get_node("appendix/RichTextLabel").bbcode_text  = kitset.appendix.name()
		
		listOfKitSets.append(kitset)





func kitslot_pressed(rowNr: int) -> void:
	#for entry in get_node("/../kit_effect_details").get_children(): entry.queue_free() 
	
	if get_node("VBoxContainer/"+str(rowNr)).get_node("Control/block").visible == false:
		var cache = get_node("../../KitSetOverview")
		cache.get_node("parent").loadKitset(listOfKitSets[rowNr])
		get_node("../../KitSetOverview").visible = true
	
	API_003_Player.stationSetter.setKitset(listOfKitSets[rowNr])





