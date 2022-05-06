extends Control


var index

func _on_Button_pressed() -> void:
	API_003_Player.currentChar.getComp("C_68_KITVENTORY").listOfKits.erase(index)
	var kitEnt = API_001_Atlas.KitParts().getEntry(index)
	API_003_Player.stationSetter.setKitPartToMod(kitEnt)
	
	var part
	if kitEnt.partType() == ENUM.KITS.PARTS.MOD      : part = "Mod"
	if kitEnt.partType() == ENUM.KITS.PARTS.APPENDIX : part = "Appendix"
	
	var previewNode = get_node("../../../../KitSetOverview/parent/"+part)
	
	previewNode.get_node("Name/Text").text    = kitEnt.name()
	previewNode.get_node("Desc/Text").bbcode_text    = "[color=grey]"+kitEnt.decription()
	previewNode.get_node("Summary/Text").bbcode_text = "[color=grey]"+kitEnt.mechanicalSummary()
	
	
	get_node("../../../../KitSetOverview/Build").visible = true
	var cache = get_node("../../../../KitSetOverview/parent/Window/Frame2")
	get_node("../../../../KitSetOverview/parent/Window/Frame2").visible = true
	get_node("../../../../KitSetOverview/parent/Merge").visible = true
