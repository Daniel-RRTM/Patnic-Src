extends Node2D


var requiredKitPartEnum 
var kitsetToModIndex
var listEntries = []



func laodItems():
	pass



func initialice(kitPartEnum):
	reset()
	
	kitsetToModIndex    = API_003_Player.getCurrentStation().kitset.base.index()
	requiredKitPartEnum = kitPartEnum
	listEntries         = getListEntries()
	
	insertKitPartsInList()




func getListEntries():
	var allOwnedKitParts = API_003_Player.currentChar._005_Common_Kitventory._005_Common_Kitventory.listOfKits
	var arrToReturn = []
	
	
	
	for kitPart in allOwnedKitParts.values():
		if kitPart.partType() == requiredKitPartEnum :  
			if  kitsetToModIndex == kitPart.getCompValue("C_60_BASE_KIT_REFERENCE"):
				arrToReturn.append(kitPart)
	
	return arrToReturn



func insertKitPartsInList():
	for i in listEntries.size():
		var currentKitPart = listEntries[i]
		
		var rowNode = getCollumnNodes(i)
		
		rowNode["NAME"].bbcode_text    = currentKitPart.name()
		rowNode["SUMMARY"].bbcode_text = currentKitPart.mechanicalSummary()
		rowNode["TIME"].bbcode_text    = currentKitPart.modTime()
		
		#get_node("VBoxContainer/"+str(i)+"/Button").kitset = currentKitPart





func getCollumnNodes(itteration):
	var prefix = "VBoxContainer/"+str(itteration)+"/"
	var suffix = "/RichTextLabel"
	return {
		"NAME"     : get_node(prefix+"Name"+suffix),
		"SUMMARY"  : get_node(prefix+"Summary"+suffix),
		"TIME"     : get_node(prefix+"Time"+suffix)
	}


func reset():
	for i in range(0,11):
		var cache = get_node("VBoxContainer/"+str(i))
		for nodeName in ["Name","Summary","Time"]:
			cache.get_node(nodeName+"/RichTextLabel").bbcode_text = ""




func selectListEntry(extra_arg_0: int) -> void:
	var selectedKitPart = listEntries[extra_arg_0]
	API_003_Player.getCurrent_005_Common_Stationetter().setKitPartToMod(selectedKitPart)
	get_node("../RichTextLabel").bbcode_text = "[color=red]"+selectedKitPart.name()+"("+str(selectedKitPart.modTime())+")"



