extends Control


var isCatSelect         = true
onready var baseBox     = get_node("base")
onready var modBox      = get_node("mod")
onready var appendixBox = get_node("app")



#>>> Selection Manager <<<#
func _on_base_item_selected(selectedNr:int) -> void:
	if " < BACK TO CATEGORY >" == baseBox.get_item_text(selectedNr)        : fillUpCategory()
	elif isCatSelect == true                                               : setKitparts(selectedNr)
	elif isCatSelect == false and baseBox.get_item_text(selectedNr) != "" : setSideBoxes()




func fillUpCategory():
	resetKitsetEntry()
	modBox.visible      = false
	appendixBox.visible = false
	isCatSelect = true
	
	for cat in ENUM.KITS.CATEGORY.keys():  
		var icon = load("res://Assets/GUI/KitSymbols/"+cat.to_lower()+".png")
		baseBox.add_icon_item(icon,cat.to_lower())



func setKitparts(catEnumNr):
	resetKitsetEntry()
	isCatSelect = false
	
	if catEnumNr != 0:
		var kitpartEnt = API_001_Atlas.KitParts().getKitGroup(catEnumNr-1)
		baseBox.loadedKitPartEntites = kitpartEnt.values()
		var nameToShow = kitpartEnt.keys()
		
		for kitpart in nameToShow: baseBox.add_item(API_001_Atlas.KitParts().getEntry(kitpart).name()) 
		baseBox.addEscape()



#>>> Selection Methods <<<#
func setSideBoxes():
	var kitpart = baseBox.loadedKitPartEntites[baseBox.selected-1]
	for entry in kitpart.modArr.values():   modBox.add_item(entry.name())



func resetKitsetEntry():
	modBox.visible      = true
	appendixBox.visible = true
	modBox.reset()
	baseBox.clear()
	baseBox.add_item("")
