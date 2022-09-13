extends Button

onready var ButtonManager = get_node("../..")

func _on_press(kitPartEnum,modeEnum):
	if kitPartEnum == ENUM.KITS.PARTS.BASE and modeEnum == ENUM.KITS.STATION_MODE.REMOVE: clearSlot()
	else:   
		API_003_Player.stationSetter.setMode(modeEnum)
		match modeEnum:
			ENUM.KITS.STATION_MODE.ADD    : selectKitPartToAdd(kitPartEnum) 
			ENUM.KITS.STATION_MODE.REMOVE : clearSlot()
			ENUM.KITS.STATION_MODE.CHANGE : selectKitPartToAdd(kitPartEnum)
	#	selectKitPartToAdd(kitPartEnum)


func selectKitPartToAdd(kitPartEnum):
	var kitPartsToShow = []
	
	var allKitParts = API_003_Player.currentChar.kitventory().kitparts().getAll()
	var kitsetToBuild = get_parent().get_parent().get_parent().get_node("parent").kitSetEnt
	
	for kitpart in allKitParts:
		var test = [kitpart.family(),kitsetToBuild.base.family(),kitpart.partType()]
		if  kitpart.family() == kitsetToBuild.base.family() and kitPartEnum == kitpart.partType():
			kitPartsToShow.append(kitpart)
			
	get_parent().get_parent().get_parent().get_parent().get_node("BuilldSelection/ScrollContainer").loadItems(kitPartsToShow)
	get_parent().get_parent().get_parent().get_parent().get_node("BuilldSelection").visible =true




func clearSlot():
	var cache = API_003_Player.getStations().currentStation.kitset
	API_003_Player.currentChar.kitventory().kitsets().remove(cache.toString)
	for part in [cache.base,cache.mod,cache.appendix]: if is_instance_valid(part):API_003_Player.currentChar.kitventory().kitparts().append(part)
	
	self.get_node("../../../parent").resetKitPart()
	#self.get_node("../../../../GearedKitSetTable/Kitsets").loadPlayerGearedKitsets()
	
	get_node("../../../../GearedKitSetTable/Kitsets").initialice(API_003_Player.currentChar.kitventory().kitsets().cacheKitset)
	
	
	get_parent().get_parent().get_parent().visible = false
	
	API_003_Player.getCurrentStationSetter().setOnDefault()









var scene = load("res://GameSrc/PatnicRoom/scenes/Gameloop/RestMode/Station/kitPartToModList/table.tscn").instance()
func showListOfRelevantKitParts(kitPartEnum) -> void:
	#getKitPartToModNode(kitPartEnum).add_child(scene)
	scene.initialice(kitPartEnum)


#
#func setNewKiSsetSlotToMod(extra_arg_0: int) -> void:
#	var cachedKitset = API_003_Player.currentChar._005_Common_Kitventory.getGearedKitSetByNr(extra_arg_0)
#	API_003_Player.getCurrent_005_Common_Stationetter().setKitset(cachedKitset)
#
#	resetNodes()
#	updateForm(cachedKitset)
#
#
#
#func resetNodes():
#	for entry in ["mod","base","appendix"]:
#		var nodePathRTL = "content/"+entry+"/RichTextLabel"
#		get_node(nodePathRTL).clear()
#
#		for button in ["add","change","remove"]:
#			var nodePathButton = "content/"+entry+"/buttons/"+button
#			get_node(nodePathButton).visible = false
#
#
#func updateForm(kitset):
#	if is_instance_valid(kitset):
#		for kitPart in kitParts:
#			uiNodes = getNodesByKitPart(kitPart,kitset)
#
#			if is_instance_valid(uiNodes.kitpart) : fillKitPart()
#			else                                  : uiNodes.voidButtons.visible = true





