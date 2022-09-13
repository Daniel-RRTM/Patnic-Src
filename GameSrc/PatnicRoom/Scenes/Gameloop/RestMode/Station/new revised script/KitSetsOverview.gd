extends Control


var listOfKitSets = []
onready var station = get_node("../../KitSetOverview")

func _ready():
	initialice(API_003_Player.currentChar.kitventory().kitsets().getAll())


func initialice(cache):
	reset()
	hideNotReachedKitSetSlots(API_003_Player.currentChar.getCompValue("C_25_MAX_KITSETS"))
	fillEntry(cache)




func reset():
	listOfKitSets.clear()
	for row in get_node("VBoxContainer").get_children():
		for collumn in row.get_children():
			if collumn is Panel: collumn.get_node("RichTextLabel").clear()



func hideNotReachedKitSetSlots(maxKitsets): 
	for i in range(maxKitsets,10):  get_node("VBoxContainer/"+str(i)).visible = false



func fillEntry(allKitsets):
	for i in allKitsets.size():
		var rowNode = get_node("VBoxContainer/"+str(i))
		var kitset  = allKitsets[i]
		
		rowNode.get_node("Mtype/RichTextLabel").bbcode_text    = "[center]"+kitset.base.mType()
		rowNode.get_node("category/RichTextLabel").bbcode_text = "[center]"+kitset.base.catType()
		rowNode.get_node("base/RichTextLabel").bbcode_text     = kitset.base.name()
		rowNode.get_node("Family/RichTextLabel").bbcode_text   = "[center]"+kitset.base.family()
		
		if is_instance_valid(kitset.mod)      : rowNode.get_node("mod/RichTextLabel").bbcode_text       = kitset.mod.name()
		if is_instance_valid(kitset.appendix) : rowNode.get_node("appendix/RichTextLabel").bbcode_text  = kitset.appendix.name()
		
		if ENUM.SOKRATILES.M_TYPE[kitset.base.mType()] != ENUM.SOKRATILES.M_TYPE.values()[Davinci.externalCachedInput]:
			rowNode.get_node("Control/block").visible = true
		
		listOfKitSets.append(kitset)





func kitslot_pressed(rowNr: int) -> void:
	if get_node("VBoxContainer/"+str(rowNr)+"/Control/block").visible == false:
		
		if rowNr < listOfKitSets.size():
			station.get_node("parent").loadKitset(listOfKitSets[rowNr])
			get_node("../../KitSetOverview").visible = true
			API_003_Player.stationSetter.setKitset(listOfKitSets[rowNr])
		
		else:
			var script = get_node("../../KitSetOverview/Buttons/Mod/Add")
			script._on_press(ENUM.KITS.PARTS.BASE,ENUM.KITS.STATION_MODE.ADD)
	





